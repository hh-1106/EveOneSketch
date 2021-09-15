
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


// Based on:
// 0. https://www.shadertoy.com/view/MdlyD8
// 1. https://www.shadertoy.com/view/4l3Gz2
// 2. https://www.shadertoy.com/view/ltdGDn

// Rain will pour faster as time goes on
// TODO: wind direction change based on camera

// Uncomment to see the rain texture only
// #define DRAW_RAIN_ONLY

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{    
    vec2 uv = fragCoord.xy / iResolution.xy;
	vec3 noise = texture(iChannel0, uv).rgb;
    
    vec3 rflct = reflect(noise, vec3(uv - vec2(1.0), 0.5));
    vec3 color = texture(iChannel1, rflct.xy).rgb;
    
    fragColor = vec4(color, 1.0 );
}











