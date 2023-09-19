// Vision EX Shader ,Editing By Isa ,Original Shader by PPSSPP Forum.

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D sampler0;
varying vec2 v_texcoord0;

void main() {
  float vignette = 1.0 - 1.9 * (dot(v_texcoord0 - 0.5, v_texcoord0 - 0.5) * 2.0);
  vec3 rgb = texture2D(sampler0, v_texcoord0.xy).xyz;
  gl_FragColor.rgb = vignette *rgb*0.7+1.0*rgb*rgb*1.2;
  gl_FragColor.a = 1.0;

}
