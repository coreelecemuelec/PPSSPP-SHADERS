// PPSSPP: SHADERS MOD GRAFIK HD™

// GRAFIK HD SHADERS 2017
// 16:52 11 MARET 2017
// SHADERS MOD BY ENDARKO
//======================================================================================================================================================================
//Extra options:
#define FXAA         1     	//ON:1/OFF:0
//================
#define GAUSS_SQ     0   	//ON:1/OFF:0
#define Gsmoothing   5.3  	//Default: 3.5
//================
#define GAUSS_S      0		//ON:1/OFF:0
//================
#define MIKU         0		//Hatsune<3
//================
#define BLOOM        0     	//ON:1/OFF:0
#define samples      0     	//Default: 4
#define quality      1.25  	//Default: 0.25
#define factor       1.002 	//Default: 0.002
#define Bpower       1.9	//Default: 0.5
//================
#define COLORED      0     	//ON:1/OFF:0
#define Cpower       1.0	//Default: 0.5
//================
#define SHARPEN      0    	//ON:1/OFF:0
#define value        7.5   	//Default: 0.5
//================
#define S_COM_V2     0		//Sharpen Complex v2
#define S_val0       5.5	//Default: 5.0
//================
#define SHADEBOOST    1    	//ON:1/OFF:0
#define saturation   1.3  	//Default: 1.0
#define brightness   1.4  	//Default: 1.0
#define contrast     1.0  	//Default: 1.0
#define red          1.0   	//Default: 1.0
#define green        1.0  	//Default: 1.0
#define blue         1.0   	//Default: 1.0
//Shadeboost presets:		//
int SEPIA =          0;		//Moody coolors:)
int GRAYSCALE =      0;		//Just for lols?
int NEGATIVE =       0;		//As above
int PSPCOLORS =      0; 	//Makes the colors as on older PSP screens(colder)
//All presets are simple switch ON:1/OFF:0, 
//================
#define GAMMA        0		//
#define	correction   1.0	//Default: 1.0
//================
#define SCANLINES    0 	// GRAFIK
#define SLsize       1		//Default: 1
#define SLcolor      2.1	//Default: 2.0
#define SLpower      1.6	//Default: 0.6
#define SLV          1          //ON:1/OFF:0 /vertical scanlines
//================
#define TEST         0  	//
#define TESTANIM     0 		//
#define testAspeed   1.0 	//======================================================================================================================================================================
//~packed together, corrected to fit requirements of popular with PPSSPP AMD legacy drivers v11.11, partially written and tested by LunaMoo (Moon Cow?;p)
//other credits mentioned earlier.

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D sampler0;
uniform vec4 u_time;

// The inverse of the texture dimensions along X and Y
uniform vec2 u_texelDelta;
uniform vec2 u_pixelDelta;
varying vec2 v_texcoord0;

//===========
float overlay(float base, float blend)
{
	float result = 0.0;
	
	if( base < 0.5 ) 
		result = 2.0 * base * blend;
	else   
		result = 1.0 - (1.0 - 2.0*(base-0.5)) * (1.0-blend);
		
	return result;
}

//===========
void main() {
  vec3 color = texture2D(sampler0, v_texcoord0.xy).xyz;
#if(FXAA==1)
  // The parameters are hardcoded for now, but could be
  // made into uniforms to control fromt he program.
  float FXAA_SPAN_MAX = 8.0;
  float FXAA_REDUCE_MUL = 7.8/8.8;
  float FXAA_REDUCE_MIN = (50.0/128.0);

  vec3 rgbNW = texture2D(sampler0, v_texcoord0.xy + vec2(-1.0, -1.0) * u_texelDelta).xyz;
  vec3 rgbNE = texture2D(sampler0, v_texcoord0.xy + vec2(+1.0, -1.0) * u_texelDelta).xyz;
  vec3 rgbSW = texture2D(sampler0, v_texcoord0.xy + vec2(-1.0, +1.0) * u_texelDelta).xyz;
  vec3 rgbSE = texture2D(sampler0, v_texcoord0.xy + vec2(+1.0, +1.0) * u_texelDelta).xyz;
  vec3 rgbM  = texture2D(sampler0, v_texcoord0.xy).xyz;
	
  vec3 luma = vec3(0.299, 0.587, 0.114);
  float lumaNW = dot(rgbNW, luma);
  float lumaNE = dot(rgbNE, luma);
  float lumaSW = dot(rgbSW, luma);
  float lumaSE = dot(rgbSE, luma);
  float lumaM  = dot( rgbM, luma);
	
  float lumaMin = min(lumaM, min(min(lumaNW, lumaNE), min(lumaSW, lumaSE)));
  float lumaMax = max(lumaM, max(max(lumaNW, lumaNE), max(lumaSW, lumaSE)));
	
  vec2 dir;
  dir.x = -((lumaNW + lumaNE) - (lumaSW + lumaSE));
  dir.y =  ((lumaNW + lumaSW) - (lumaNE + lumaSE));
	
  float dirReduce = max((lumaNW + lumaNE + lumaSW + lumaSE) * (0.25 * FXAA_REDUCE_MUL), FXAA_REDUCE_MIN);
	  
  float rcpDirMin = 1.0/(min(abs(dir.x), abs(dir.y)) + dirReduce);
	
  dir = min(vec2(FXAA_SPAN_MAX,  FXAA_SPAN_MAX), 
        max(vec2(-FXAA_SPAN_MAX, -FXAA_SPAN_MAX), dir * rcpDirMin)) * u_texelDelta;
		
  vec3 rgbA = (1.0/2.0) * (
              texture2D(sampler0, v_texcoord0.xy + dir * (1.0/3.0 - 0.5)).xyz +
              texture2D(sampler0, v_texcoord0.xy + dir * (2.0/3.0 - 0.5)).xyz);
  vec3 rgbB = rgbA * (1.0/2.0) + (1.0/4.0) * (
              texture2D(sampler0, v_texcoord0.xy + dir * (0.0/3.0 - 0.5)).xyz +
              texture2D(sampler0, v_texcoord0.xy + dir * (3.0/3.0 - 0.5)).xyz);
  float lumaB = dot(rgbB, luma);
  
  if((lumaB < lumaMin) || (lumaB > lumaMax)){
	color=rgbA;
  } else {
    color=rgbB;
  }
#endif
#if(GAUSS_SQ==1)
  float GAUSS_KERNEL_SIZE = 5.0;
  //indices
  //  00 01 02 03 04
  //  05 06 07 08 09
  //  10 11 12 13 14
  //  15 16 17 18 19
  //  20 21 22 23 24

  //filter strength, rather smooth 
  //  01 04 07 04 01
  //  04 16 26 16 04
  //  07 26 41 26 07
  //  04 16 26 16 04
  //  01 04 07 04 01

  vec2 offset = u_pixelDelta*Gsmoothing/GAUSS_KERNEL_SIZE;
  
  vec3 cGauss0 =  1.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2(-2.0,-2.0)).xyz;
  vec3 cGauss1 =  4.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2(-1.0,-2.0)).xyz;
  vec3 cGauss2 =  7.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 0.0,-2.0)).xyz;
  vec3 cGauss3 =  4.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 1.0,-2.0)).xyz;
  vec3 cGauss4 =  1.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 2.0,-2.0)).xyz;
  vec3 cGauss5 =  4.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2(-2.0,-1.0)).xyz;
  vec3 cGauss6 = 16.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2(-1.0,-1.0)).xyz;
  vec3 cGauss7 = 26.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 0.0,-1.0)).xyz;
  vec3 cGauss8 = 16.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 1.0,-1.0)).xyz;
  vec3 cGauss9 =  4.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 2.0,-1.0)).xyz;
  vec3 cGauss10=  7.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2(-2.0, 0.0)).xyz;
  vec3 cGauss11= 26.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2(-1.0, 0.0)).xyz;
  vec3 cGauss12= 41.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 0.0, 0.0)).xyz;
  vec3 cGauss13= 26.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 1.0, 0.0)).xyz;
  vec3 cGauss14=  7.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 2.0, 0.0)).xyz;
  vec3 cGauss15=  4.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2(-2.0, 1.0)).xyz;
  vec3 cGauss16= 16.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2(-1.0, 1.0)).xyz;
  vec3 cGauss17= 26.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 0.0, 1.0)).xyz;
  vec3 cGauss18= 16.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 1.0, 1.0)).xyz;
  vec3 cGauss19=  4.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 2.0, 1.0)).xyz;
  vec3 cGauss20=  1.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2(-2.0, 2.0)).xyz;
  vec3 cGauss21=  4.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2(-1.0, 2.0)).xyz;
  vec3 cGauss22=  7.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 0.0, 2.0)).xyz;
  vec3 cGauss23=  4.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 1.0, 2.0)).xyz;
  vec3 cGauss24=  1.0 * texture2D(sampler0, v_texcoord0.xy + offset * vec2( 2.0, 2.0)).xyz;
 
  color.xyz =	cGauss0 + 
		cGauss1 +
		cGauss2 +
		cGauss3 +
		cGauss4 +
		cGauss5 +
		cGauss6 +
		cGauss7 +
		cGauss8 +
		cGauss9 +
		cGauss10 +
		cGauss11 +
		cGauss12 +
		cGauss13 + 
		cGauss14 +
		cGauss15 +
		cGauss16 +
		cGauss17 +
		cGauss18 +
		cGauss19 +
		cGauss20 +
		cGauss21 +
		cGauss22 +
		cGauss23 +
		cGauss24;
  color.xyz = color.xyz / 273.0;
#endif
#if(GAUSS_S==1)
  // The parameters are hardcoded for now, but could be
  // made into uniforms to control fromt he program.
  float GAUSSS_SPAN_MAX = 1.5;

  //just a variable to describe the maximu
  float GAUSSS_KERNEL_SIZE = 5.0;
  //indices
  //  XX XX 00 XX XX
  //  XX 01 02 03 XX
  //  04 05 06 07 08
  //  XX 09 10 11 XX
  //  XX XX 12 XX XX

  //filter strength, rather smooth 
  //  XX XX 01 XX XX
  //  XX 03 08 03 XX
  //  01 08 10 08 01
  //  XX 03 08 03 XX
  //  XX XX 01 XX XX

  vec2 offsetS = u_pixelDelta*GAUSSS_SPAN_MAX/GAUSSS_KERNEL_SIZE;
  
  vec3 cGaussS0 =  1.0 * texture2D(sampler0, v_texcoord0.xy + offsetS * vec2( 0.0,-2.0)).xyz;
  vec3 cGaussS1 =  3.0 * texture2D(sampler0, v_texcoord0.xy + offsetS * vec2(-1.0,-1.0)).xyz;
  vec3 cGaussS2 =  8.0 * texture2D(sampler0, v_texcoord0.xy + offsetS * vec2( 0.0,-1.0)).xyz;
  vec3 cGaussS3 =  3.0 * texture2D(sampler0, v_texcoord0.xy + offsetS * vec2( 1.0,-1.0)).xyz;
  vec3 cGaussS4 =  1.0 * texture2D(sampler0, v_texcoord0.xy + offsetS * vec2(-2.0, 0.0)).xyz;
  vec3 cGaussS5 =  8.0 * texture2D(sampler0, v_texcoord0.xy + offsetS * vec2(-1.0, 0.0)).xyz;
  vec3 cGaussS6 = 10.0 * texture2D(sampler0, v_texcoord0.xy + offsetS * vec2( 0.0, 0.0)).xyz;
  vec3 cGaussS7 =  8.0 * texture2D(sampler0, v_texcoord0.xy + offsetS * vec2( 1.0, 0.0)).xyz;
  vec3 cGaussS8 =  1.0 * texture2D(sampler0, v_texcoord0.xy + offsetS * vec2( 2.0, 0.0)).xyz;
  vec3 cGaussS9 =  3.0 * texture2D(sampler0, v_texcoord0.xy + offsetS * vec2(-1.0, 1.0)).xyz;
  vec3 cGaussS10=  8.0 * texture2D(sampler0, v_texcoord0.xy + offsetS * vec2( 0.0, 1.0)).xyz;
  vec3 cGaussS11=  3.0 * texture2D(sampler0, v_texcoord0.xy + offsetS * vec2( 1.0, 1.0)).xyz;
  vec3 cGaussS12=  1.0 * texture2D(sampler0, v_texcoord0.xy + offsetS * vec2( 0.0, 2.0)).xyz;
  
  color =     cGaussS0 + 
              cGaussS1 +
              cGaussS2 +
              cGaussS3 +
              cGaussS4 +
              cGaussS5 +
              cGaussS6 +
              cGaussS7 +
              cGaussS8 +
              cGaussS9 +
              cGaussS10 +
              cGaussS11 +
              cGaussS12;
  color = color / 58.0;
#endif
vec3 colorB=color;
int hatsu = 0;
#if(MIKU==1)
	vec3 mmm = vec3(0.1, 0.1, 0.1);
	hatsu = 1;
	color = mix(color,mmm, 0.9);
#endif
#if(COLORED==1)
    vec3 blur = color * 1.22520613262190495;	
	vec3 newcolor = vec3(overlay(color.r,blur.r),
							 overlay(color.g,blur.g),
							 overlay(color.b,blur.b));
	color = mix(color, newcolor, Cpower);
#endif
#if(BLOOM==1)
   vec4 sum = vec4(0);
   int j;
   int diffx = samples - 1;
   int i;
   int diffy = samples;
   vec3 bloom;
   for( i= -diffy ;i < diffy; i++)
   {
        for (j = -diffx; j < diffx; j++)
        {
            sum += texture2D(sampler0, v_texcoord0.xy + vec2(j, i)*factor) * quality;
        }
   }
    if(color.r < 0.3 && color.g < 0.3 && color.b < 0.3)
    {
       bloom = sum.xyz*sum.xyz*0.012 + color;
    }
    else
    {
        if(color.r < 0.5 && color.g < 0.5 && color.b < 0.5)
        {
            bloom = sum.xyz*sum.xyz*0.009 + color;
        }
        else
        {
            bloom = sum.xyz*sum.xyz*0.0075 + color;
        }
    }							 
	color = mix(color, bloom, Bpower);
	if(hatsu==1){
		color = mix(colorB, color, 0.5);
	}	
#endif
#if(SHARPEN==1)
	color -= texture2D(sampler0, v_texcoord0.xy+0.0001).xyz*value;
	color += texture2D(sampler0, v_texcoord0.xy-0.0001).xyz*value;
#endif
#if(S_COM_V2==1)
	#define width  (v_texcoord0.x)
	#define height (v_texcoord0.y)
	#define px (u_texelDelta.x)
	#define py (u_texelDelta.y)
	#define dx (mean * px)
	#define dy (mean * py)
	#define mean 0.6
	#define CoefOrig (1 + CoefBlur)
	#define CoefBlur 2
	#define Sharpen_val1 ((S_val0 - 1) / 8.0)
	#define S_Edge 0.2
	// get original pixel
	vec3 orig = texture2D(sampler0, v_texcoord0).xyz;

	// compute blurred image (gaussian filter)
	vec3 c1 = texture2D(sampler0, v_texcoord0 + vec2(-dx, -dy)).xyz;
	vec3 c2 = texture2D(sampler0, v_texcoord0 + vec2(  0, -dy)).xyz;
	vec3 c3 = texture2D(sampler0, v_texcoord0 + vec2( dx, -dy)).xyz;
	vec3 c4 = texture2D(sampler0, v_texcoord0 + vec2(-dx,   0)).xyz;
	vec3 c5 = texture2D(sampler0, v_texcoord0 + vec2( dx,   0)).xyz;
	vec3 c6 = texture2D(sampler0, v_texcoord0 + vec2(-dx,  dy)).xyz;
	vec3 c7 = texture2D(sampler0, v_texcoord0 + vec2(  0,  dy)).xyz;
	vec3 c8 = texture2D(sampler0, v_texcoord0 + vec2( dx,  dy)).xyz;

	// gaussian filter
	// [ 1, 2, 1 ]
	// [ 2, 4, 2 ]
	// [ 1, 2, 1 ]
	// to normalize the values, we need to divide by the coeff sum
	// 1 / (1+2+1+2+4+2+1+2+1) = 1 / 16 = 0.0625
	vec3 flou = (c1 + c3 + c6 + c8 + 2 * (c2 + c4 + c5 + c7) + 4 * orig) * 0.0625;

	// substract blurred image from original image
	vec3 corrected = CoefOrig * orig - CoefBlur * flou;

	// edge detection
	// Get neighbor points
	// [ c1,   c2, c3 ]
	// [ c4, orig, c5 ]
	// [ c6,   c7, c8 ]
	c1 = texture2D(sampler0, v_texcoord0 + vec2(-px, -py)).xyz;
	c2 = texture2D(sampler0, v_texcoord0 + vec2(  0, -py)).xyz;
	c3 = texture2D(sampler0, v_texcoord0 + vec2( px, -py)).xyz;
	c4 = texture2D(sampler0, v_texcoord0 + vec2(-px,   0)).xyz;
	c5 = texture2D(sampler0, v_texcoord0 + vec2( px,   0)).xyz;
	c6 = texture2D(sampler0, v_texcoord0 + vec2(-px,  py)).xyz;
	c7 = texture2D(sampler0, v_texcoord0 + vec2(  0,  py)).xyz;
	c8 = texture2D(sampler0, v_texcoord0 + vec2( px,  py)).xyz;

	// using Sobel filter
	// horizontal gradient
	// [ -1, 0, 1 ]
	// [ -2, 0, 2 ]
	// [ -1, 0, 1 ]
	vec3 delta1 = (c3 + 2 * c5 + c8) - (c1 + 2 * c4 + c6);

	// Save some arithmetic operations to ensure PS2 compatibility
	c1 += c3;
	c6 += c8;
	// vertical gradient
	// [ -1, - 2, -1 ]
	// [  0,   0,  0 ]
	// [  1,   2,  1 ]
	vec3 delta2 = (c6 + 2 * c7 /*+ c8*/) - (c1 + 2 * c2 /*+ c3*/);

	// computation
	if (sqrt(mul(delta1, delta1) + mul(delta2, delta2)) > S_Edge) {
		// if we have an edge, use sharpen
		vec3 scomplexv2 = orig * S_val0 - (c1 + c2 /*+ c3*/ + c4 + c5 + c6 + c7 /*+ c8*/) * Sharpen_val1;
		color=mix(color,scomplexv2,0.5);
	} else {
		// else return corrected image
		vec3 scomplexv2 = corrected;
		color=mix(color,scomplexv2,1.0);
	}
#endif
#if(SHADEBOOST==1)
	float sat = saturation;
	float brt = brightness;
	float con = contrast;

	// Increase or decrease theese values to adjust r, g and b color channels seperately
	float AvgLumR = red;
	float AvgLumG = green;
	float AvgLumB = blue;
	
	//==========================presets
	if(SEPIA==1)
	{
		sat = 0.01;
		brt = 1.75;
		con = 1.0;
		AvgLumR = 0.44;
		AvgLumG = 0.26;
		AvgLumB = 0.08;
	}
	if(GRAYSCALE==1)
	{
		sat = 0.0;
		brt = 1.0;
		con = 1.0;
		AvgLumR = 1.0;
		AvgLumG = 1.0;
		AvgLumB = 1.0;
	}
	if(NEGATIVE==1)
	{
		sat = 1.0;
		brt = 1.0;
		con = -1.0;
		AvgLumR = 1.0;
		AvgLumG = 1.0;
		AvgLumB = 1.0;
	}
	if(PSPCOLORS==1)
	{
		sat = 1.0;
		brt = 1.0;
		con = 1.0;
		AvgLumR = 0.9593;
		AvgLumG = 1.0739;
		AvgLumB = 1.4604;
	}
	//==========================	
	const vec3 LumCoeff = vec3(0.2125, 0.7154, 0.0721);
	
	vec3 AvgLumin = vec3(AvgLumR, AvgLumG, AvgLumB);
	vec3 conRGB = vec3(0.5, 0.5, 0.5);
	vec3 brtColor = color.rgb * brt;
	vec3 intensity = vec3((brtColor.r*LumCoeff.r)+(brtColor.g*LumCoeff.g)+(brtColor.b*LumCoeff.b)); //workaround for AMD legacy drivers could be just dot(brtColor,LumCoeff) ;c
	vec3 satColor = mix(intensity, brtColor, sat);
	vec3 conColor = mix(conRGB, satColor, con);
	vec3 mixColor = AvgLumin * conColor;

	color.rgb = mixColor;
#endif
#if(GAMMA==1)
	vec3 gam=vec3(pow(color.r,1.0/abs(correction)),pow(color.g,1.0/abs(correction)),pow(color.b,1.0/abs(correction)));
	color=mix(color,gam,1);
#endif
#if(SCANLINES==1)
	int vscan = SLV;
	vec3 colorSL=color*SLcolor;
	float rey = (1.0/SLsize/u_pixelDelta.y);
	float rex = (1.0/SLsize/u_pixelDelta.x);
	float posSy = v_texcoord0.y*(rey/1.0);
	float posSx = v_texcoord0.x*(rex/1.0);
	float lineSy = mod(posSy,2.0);
	float lineSx = mod(posSx,2.0);
	if(vscan==0){color=color-lineSy;}
	if(vscan==1){color=color-lineSx;}
	color=mix(color,colorSL,SLpower);
#endif
#if(TEST==1)
	if(v_texcoord0.x<0.5)
	{
		color.xyz=color.xyz;
	}
	else
	{
		color.xyz=texture2D(sampler0, v_texcoord0.xy).xyz;
	}
#endif
#if(TESTANIM==1)
	float anim=(sin(u_time.x*testAspeed)+0.9)*0.55;
	if(v_texcoord0.x<anim)
	{
		color.xyz=color.xyz;
	}
	else
	{
		color.xyz=texture2D(sampler0, v_texcoord0.xy).xyz;
	}
#endif
  gl_FragColor.xyz=color;
  gl_FragColor.a = 1.0;
}

