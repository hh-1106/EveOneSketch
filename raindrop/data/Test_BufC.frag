
#version 150

#define SAMPLER0 sampler2D // sampler2D, sampler3D, samplerCube
#define SAMPLER1 sampler2D // sampler2D, sampler3D, samplerCube
#define SAMPLER2 sampler2D // sampler2D, sampler3D, samplerCube
#define SAMPLER3 sampler2D // sampler2D, sampler3D, samplerCube

uniform SAMPLER0 iChannel0; // image/buffer/sound    Sampler for input textures 0
uniform SAMPLER1 iChannel1; // image/buffer/sound    Sampler for input textures 1
uniform SAMPLER2 iChannel2; // image/buffer/sound    Sampler for input textures 2
uniform SAMPLER3 iChannel3; // image/buffer/sound    Sampler for input textures 3

uniform vec3  iResolution;           // image/buffer          The viewport resolution (z is pixel aspect ratio, usually 1.0)
uniform float iTime;                 // image/sound/buffer    Current time in seconds
uniform float iTimeDelta;            // image/buffer          Time it takes to render a frame, in seconds
uniform int   iFrame;                // image/buffer          Current frame
uniform float iFrameRate;            // image/buffer          Number of frames rendered per second
uniform vec4  iMouse;                // image/buffer          xy = current pixel coords (if LMB is down). zw = click pixel
uniform vec4  iDate;                 // image/buffer/sound    Year, month, day, time in seconds in .xyzw
uniform float iSampleRate;           // image/buffer/sound    The sound sample rate (typically 44100)
uniform float iChannelTime[4];       // image/buffer          Time for channel (if video or sound), in seconds
uniform vec3  iChannelResolution[4]; // image/buffer/sound    Input texture resolution for each channel


// This buffer generates larger sized drops

float density = 3.6;
float metasze = 1e2;
vec4  noffset = vec4( 10.0, 2500.0, -90.0, 0.5 );

#define clamp01(a) clamp(a, 0., 1.)
#define sstep01(a) smoothstep(0., 1., a)

vec4 getPerlinMap(int index)
{
    float x = float(mod(float(index), iResolution.y)) / iResolution.x;
    float y = float(mod(float(index), iResolution.y)) / iResolution.y;
    return texture(iChannel1, vec2(x,y));
}

vec2 rotuv(vec2 uv, float angle, vec2 center)
{
    float c = cos(angle);
    float s = sin(angle);
   	return mat2(+c, -s, +s, +c) * (uv - center) + center;
}

float metaBall(vec2 uv)
{
	return length(fract(uv) - vec2(0.5));
}

float metaNoise(vec2 uv)
{
	float metaball = metasze;
    
    for(int i = 0; i < 20; i++)
    {
        vec4 n = getPerlinMap(i) * noffset;
    	vec2 c = vec2(n.y, n.z) - n.a;
    	vec2 uvr = rotuv(uv*n.x, n.x + n.a, c);
    	
        metaball *= clamp01(metaBall(uvr) * density);
    }
    
    return sstep01(metaball);
}

vec3 calculateNormals(vec2 uv)
{
    float offsetX = 1./iResolution.x;
    float offsetY = 1./iResolution.y;
	vec2 ovX = vec2(0.0, offsetX);
	vec2 ovY = vec2(0.0, offsetY);
    
	float X = (metaNoise(uv - ovX.yx) - metaNoise(uv + ovX.yx));
    float Y = (metaNoise(uv - ovY.xy) - metaNoise(uv + ovY.xy));
    float Z = sqrt(1.0 - clamp01(dot(vec2(X,Y), vec2(X,Y))));
    
	return normalize(vec3(X,Y,Z));
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
    vec3 nl = calculateNormals(uv) * 0.5 + texture(iChannel0,uv).rgb * 0.5;
	fragColor = vec4(nl, 1.0);
}