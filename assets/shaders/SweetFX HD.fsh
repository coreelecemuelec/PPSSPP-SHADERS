//===========================//
//edit angka yang ada dibawah ini untuk mengatur tampilan

#define warna 1.8 //normal: 1.0 
#define cerah 1.3 //normal: 1.4
#define kontras 0.9 //normal: 0.8

#define kemerahan 0.9 //normal: 1.0
#define kehijauan 1.1 //normal: 1.2
#define kebiruan 1.2 //normal: 1.4

//semakin tinggi angka depan yang dirubah, maka akan semakin tidak baik ^,^
//===========================//



//Shader SweetFX
//Build by Blur YG
//FB : Yosep Galih
//Email : Dheblur36@gmail.com



///////////////////////////////////
//dibawah ini tidak boleh di edit//
///////////////////////////////////
#define sugoicolor 1
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D sampler0;
uniform vec4 u_time;

uniform vec2 u_texelDelta;
uniform vec2 u_pixelDelta;
varying vec2 v_texcoord0;

float overlay(float base, float blend)
{float result = 0.0;
if( base < 0.5 )
result = 2.0 * base * blend;
else
result = 1.0 - (1.0 - 2.0*(base-0.5)) * (1.0-blend);
return result;}

void main()
{vec3 color = texture2D(sampler0, v_texcoord0.xy).xyz;
#if(sugoicolor==1)

float sat = warna;
float brt = cerah;
float con = kontras;

float AvgLumR = kemerahan;
float AvgLumG = kehijauan;
float AvgLumB = kebiruan;

const vec3 LumCoeff = vec3(0.2125, 0.7154, 0.0721);

vec3 AvgLumin = vec3(AvgLumR, AvgLumG, AvgLumB);
vec3 conRGB = vec3(0.5, 0.5, 0.5);
vec3 brtColor = color.rgb * brt;
vec3 intensity = vec3((brtColor.r*LumCoeff.r)+(brtColor.g*LumCoeff.g)+(brtColor.b*LumCoeff.b));
vec3 satColor = mix(intensity, brtColor, sat);
vec3 conColor = mix(conRGB, satColor, con);
vec3 mixColor = AvgLumin * conColor;

color.rgb = mixColor;

#endif

gl_FragColor.xyz=color;
gl_FragColor.a = 1.0;}