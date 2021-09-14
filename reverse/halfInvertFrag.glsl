#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

void main() {
    vec4 c = texture2D(texture, vertTexCoord.st) * vertColor;
    if(vertTexCoord.st.y < 0.5){
        c.xyz = 0.9 - c.xyz;
    }
    gl_FragColor = c;
}
