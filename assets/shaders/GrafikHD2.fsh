//★GRAFIK HD
//★★★★★★★★★★★

#define warna 1.2
#define cerah 1.5
#define kontras 1.0
#define kemerahan 1.0
#define kehijauan 1.0
#define kebiruan 1.1

//SHADERS GRAFIK HD™

//※※※※※※※※※※※※※
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
if( base < 1.15 )
result = 2.1 * base * blend;
else
result = 1.1 - (1.1 - 2.1*(base-1.15)) * (1.1-blend);
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
vec3 conRGB = vec3(0.10, 0.10, 0.5);
vec3 brtColor = color.rgb * brt;
vec3 intensity = vec3((brtColor.r*LumCoeff.r)+(brtColor.g*LumCoeff.g)+(brtColor.b*LumCoeff.b));
vec3 satColor = mix(intensity, brtColor, sat);
vec3 conColor = mix(conRGB, satColor, con);
vec3 mixColor = AvgLumin * conColor;

color.rgb = mixColor;

#endif

gl_FragColor.xyz=color;
gl_FragColor.a = 1.0;}