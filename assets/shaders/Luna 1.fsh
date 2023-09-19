//Note  : Recommend to use PPSSPP v1.1.1-183-gb411fc0 or newer for full functionality, there were some bugs in earlier versions.
//Note2 : Upscaling, smoothing and sharpening filters are not set to be mixed between each other since the results are pointless(they counter each other).
//        Only last one applies, so pick just one of them, mess around with it's settings and add other effects as needed.
//======================================================================================================================================================================
//SMOOTHING FILTERS:		//If you love smooth graphics ~ those are also great for downscaling - to do that, you need to use higher rendering res than your display res
//================
#define FXAA         0     	//ON:1/OFF:0 /default FXAA, orginal info below
//================
#define GAUSS_SQ     1     	//ON:1/OFF:0 /full square gauss filtering
#define Gsmoothing   3.5   	//Default: 3.5 /increase for smoother(blurry) graphics
//================
#define GAUSS_S      0	   	//ON:1/OFF:0 /simple gauss filtering by Bigpet, slightly different from above /you can find standalone in https://github.com/hrydgard/ppsspp/issues/7242
//================
//SHARPENING FILTERS:		//if you need very sharp image, add lots of aliasing
//================
#define SHARPEN      0     	//ON:1/OFF:0 /a simple sharpen filter, might be counterproductive to FXAA and BLOOM, hence disabled by default
#define value        7.5   	//Default: 7.5 /higher = more visible effect
//================
#define S_COM_V2     0	   	//Sharpen Complex v2 from https://github.com/mpc-hc similar to above in effect, maybe more accurate
#define S_val0       5.0   	//Default: 5.0 /higher ~ increases sharpness /negative ~ can add extra blurr/strange effect
//================
//UPSCALING FILTERS:		//To use those, you have to set rendering res to smaller than window/display size(x1 for best results) and screen scaling filter to "nearest"
				//Starting from v1.1.1-28-g70e9979 you can also add Upscaling=True to ini file(check example) to do it automatically
//================
#define xBR          0     	//ON:1/OFF:0 /5xBR upscale, nice for 2D games especially those that might be buggy with higher rendering res, initially made by Hyllian - license below
#define VariantB     0     	//ON:1/OFF:0 /slightly less effect on fonts, dots and other small details
//================
#define xHQ          0     	//ON:1/OFF:0 same as 4xHQ in PPSSPP, but actually using output resolution
#define scaleoffset  0.75  	//Default: 0.75 /you can tweek it between 0.5 and 1.0, Note: to little = no effect, to high = ugliness
//================
//OTHER FILTERS:		//Most effects from here on can be fully mixed without loosing previous effects. Exceptions: Natural Colors, Advanced Cartoon
//================
#define BLOOM        1     	//ON:1/OFF:0 /bloom implementation from "my heroics" blog http://myheroics.wordpress.com/2008/09/04/glsl-bloom-shader/
#define MIKU         0     	//Hatsune<3 this is an optional bloom filter for all those pale anime faces which get white otherwise:P tested on Miku in white dress
#define samples      3     	//Default: 4 /higher = more glow, worse performance
#define quality      0.22  	//Default: 0.18 /lower = smaller glow, better quality
#define Bpower       1.0  	//Default: 1.0 /amount of bloom mixed
//================
#define COLORED      1     	//ON:1/OFF:0 /coloring part of KrossX Overlay Bloom shader from here http://www.mediafire.com/krossx#ste5pa5ijfa0o
#define Cpower       0.5   	//Default: 0.5 /strenght of the effect
//================
#define NATURALC     0     	//ON:1/OFF:0 /by popular demand, natular colors, note: this shader can't be fully mixed with smoothing/sharpening/upscaling effects
#define ncpower      0.5   	//Default:0.5 / higher = more natural color, check note line above
//================
#define ACARTOON     0     	//ON:1/OFF:0 Advanced Cartoon from Guest shader pack
#define th           0.10  	//Default: 0.10 /outlines sensitivity, recommended from 0.00...0.50
#define bb           0.45  	//Default: 0.45 /outlines strength,    recommended from 0.10...2.00
#define pp           1.50  	//Default: 1.50 /outlines blackening,  recommended from 0.25...2.00
#define acpower      0.5   	//Default:0.5 / higher = more effect, note: this shader can't be fully mixed with smoothing/sharpening/upscaling effects
//================
#define SHADEBOOST   0     	//ON:1/OFF:0 /color correction from GSdx/pcsx2 plugin, initially taken from http://irrlicht.sourceforge.net/phpBB2/viewtopic.php?t=21057 
#define saturation   1.3   	//Default: 1.0 //negative will look like inverted colors shader
#define brightness   1.3   	//Default: 1.0
#define contrast     1.0   	//Default: 1.0 //negative will be... well negative;p
#define red          1.0   	//Default: 1.0
#define green        1.0   	//Default: 1.0
#define blue         1.2   	//Default: 1.0
//Shadeboost presets:		//Shadeboost must be activated, presets override options above
int SEPIA =          0;	   	//Moody coolors:)
int GRAYSCALE =      0;	   	//Just for lols?
int NEGATIVE =       0;	   	//As above
int PSPCOLORS =      9;    	//Makes the colors as on older PSP screens(colder)
//^All presets are simple switch ON:1/OFF:0, 
//================
#define GAMMA        1	   	//simple gamma function after reading http://filmicgames.com/archives/299
#define	correction   0.85  	//Default: 1.0
//================
#define SCANLINES    0	   	//Ugly lines which never existed on psp, yet are popular among some people(I had to, sorry:P)
#define SLsize       1     	//Default: 1 /basically sets how wide each line is, from 1 to looks_weird_when_too_high
#define SLcolor      2.8   	//Default: 2.8 /brightens screen to compensate for dark lines
#define SLpower      0.4   	//Default: 0.4 /less/more = darker/brighter lines, 
#define SLV          0     	//ON:1/OFF:0 /vertical scanlines
//================
#define VIGNETTE     0     	//ON:1/OFF:0 /same as in PPSSPP, just with few settings
#define vsize        1.2   	//Default: 1.2 /winter... I mean darkness is coming ~ with higher values
#define VIpos        0.0   	//Default: 0.0 /position of the effect between 0.0 and less than 0.5(where it disappears completely)
#define deVi         0     	//ON:1/OFF:0 /reverse vignette
//================
#define TEST         0     	//test mode, applies shaders on half of the screen for easy result comparism and tweaking
#define TESTANIM     0 	   	//as above, animation slides shader from left to right and back /use only one
#define testAspeed   1.0   	//animation speed
//======================================================================================================================================================================
//~packed together, corrected to fit requirements of popular with PPSSPP AMD legacy drivers v11.11(if it works on that, it will on almost anything lol),
// currently meet requirements of GLSL version 100 meaning it will probably run on anything unless the driver is horribly broken
// partially written, ported to glsl where required and tested by LunaMoo (Moon Cow?;p),
// other credits mentioned earlier, any more info / required licenses can be found below.




/*
  FXAA shader, GLSL code adapted from:
  http://horde3d.org/wiki/index.php5?title=Shading_Technique_-_FXAA
  Whitepaper describing the technique:
  http://developer.download.nvidia.com/assets/gamedev/files/sdk/11/FXAA_WhitePaper.pdf
*/

/*
   Hyllian's 5xBR v3.5a Shader
   
   Copyright (C) 2011 Hyllian/Jararaca - sergiogdb@gmail.com
  
   This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License
   as published by the Free Software Foundation; either version 2
   of the License, or (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
   
*/

/*
	4xGLSL HqFilter shader, Modified to use in PPSSPP. Grabbed from:
	http://forums.ngemu.com/showthread.php?t=76098

	by guest(r) (guest.r@gmail.com)
	License: GNU-GPL

	Shader notes: looks better with sprite games
*/

/*
   Advanced Cartoon shader
   
   Copyright (C) 2006 guest(r) - guest.r@gmail.com

   This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License
   as published by the Free Software Foundation; either version 2
   of the License, or (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

*/

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D sampler0;
uniform vec4 u_time;


//===========
// The inverse of the texture dimensions along X and Y
uniform vec2 u_texelDelta;
uniform vec2 u_pixelDelta;
varying vec2 v_texcoord0;
varying vec4 v_texcoordNC0;
varying vec4 v_texcoordNC1;
varying vec4 v_texcoordNC2;
varying vec4 v_texcoordNC3;

const float coef = 2.0;
const vec3  rgbw = vec3(16.163, 23.351, 8.4772);

const vec4 Ao = vec4( 1.0, -1.0, -1.0, 1.0 );
const vec4 Bo = vec4( 1.0,  1.0, -1.0,-1.0 );
const vec4 Co = vec4( 1.5,  0.5, -0.5, 0.5 );
const vec4 Ax = vec4( 1.0, -1.0, -1.0, 1.0 );
const vec4 Bx = vec4( 0.5,  2.0, -0.5,-2.0 );
const vec4 Cx = vec4( 1.0,  1.0, -0.5, 0.0 );
const vec4 Ay = vec4( 1.0, -1.0, -1.0, 1.0 );
const vec4 By = vec4( 2.0,  0.5, -2.0,-0.5 );
const vec4 Cy = vec4( 2.0,  0.0, -1.0, 0.5 );


vec4 df(vec4 A, vec4 B) {
	return abs(A-B);
}

vec4 weighted_distance(vec4 a, vec4 b, vec4 c, vec4 d, vec4 e, vec4 f, vec4 g, vec4 h) {
	return (df(a,b) + df(a,c) + df(d,e) + df(d,f) + 4.0*df(g,h));
}

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
vec3 processFXAA(vec3 color){
	//The parameters are hardcoded for now, but could be
	//made into uniforms to control fromt he program.
	float FXAA_SPAN_MAX = 8.0;
	float FXAA_REDUCE_MUL = 1.0/8.0;
	float FXAA_REDUCE_MIN = (1.0/128.0);

	vec3 rgbNW = texture2D(sampler0, v_texcoord0 + vec2(-1.0, -1.0) * u_texelDelta).xyz;
	//#define Pass_Diffuse(v2TexCoord) texture2D(sampler0, v2TexCoord).xyz
	//vec3 rgbNW = Pass_Diffuse(v2TexCoord + vec2(-u_texelDelta.x, -u_texelDelta.y)).xyz;
	vec3 rgbNE = texture2D(sampler0, v_texcoord0 + vec2(+1.0, -1.0) * u_texelDelta).xyz;
	vec3 rgbSW = texture2D(sampler0, v_texcoord0 + vec2(-1.0, +1.0) * u_texelDelta).xyz;
	vec3 rgbSE = texture2D(sampler0, v_texcoord0 + vec2(+1.0, +1.0) * u_texelDelta).xyz;
	vec3 rgbM  = texture2D(sampler0, v_texcoord0).xyz;

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
		texture2D(sampler0, v_texcoord0 + dir * (1.0/3.0 - 0.5)).xyz +
		texture2D(sampler0, v_texcoord0 + dir * (2.0/3.0 - 0.5)).xyz);
	vec3 rgbB = rgbA * (1.0/2.0) + (1.0/4.0) * (
		texture2D(sampler0, v_texcoord0 + dir * (0.0/3.0 - 0.5)).xyz +
		texture2D(sampler0, v_texcoord0 + dir * (3.0/3.0 - 0.5)).xyz);
	float lumaB = dot(rgbB, luma);

	if((lumaB < lumaMin) || (lumaB > lumaMax)){
	color=rgbA;
	} else {
		color=rgbB;
	}
	return color;
}

vec3 processGAUSS_SQ(vec3 color){
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

	color.xyz = cGauss0 + cGauss1 + cGauss2 + cGauss3 + cGauss4 + cGauss5 + cGauss6 + cGauss7 + cGauss8 + cGauss9 + cGauss10 + cGauss11 + cGauss12 + cGauss13 + cGauss14 + cGauss15 + cGauss16 + cGauss17 + cGauss18 + cGauss19 + cGauss20 + cGauss21 + cGauss22 + cGauss23 + cGauss24;
	color.xyz = color.xyz / 273.0;
	return color;
}
vec3 processGAUSS_S(vec3 color){
	//The parameters are hardcoded for now, but could be
	//made into uniforms to control fromt he program.
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

	color = cGaussS0 + cGaussS1 + cGaussS2 + cGaussS3 + cGaussS4 + cGaussS5 + cGaussS6 + cGaussS7 + cGaussS8 + cGaussS9 + cGaussS10 + cGaussS11 + cGaussS12;
	color = color / 58.0;
	return color;
}
bvec4 _and_(bvec4 A, bvec4 B) {
	return bvec4(A.x && B.x, A.y && B.y, A.z && B.z, A.w && B.w);
}
bvec4 _or_(bvec4 A, bvec4 B) {
	return bvec4(A.x || B.x, A.y || B.y, A.z || B.z, A.w || B.w);
} 
bvec4 close(vec4 A, vec4 B) {
	return (lessThan(df(A, B), vec4(15.0)));
}
vec3 processxBR(vec3 color){
	bvec4 edr, edr_left, edr_up, px; // px = pixel, edr = edge detection rule
	bvec4 interp_restriction_lv1, interp_restriction_lv2_left, interp_restriction_lv2_up;
	bvec4 nc; // new_color
	bvec4 fx, fx_left, fx_up; // inequations of straight lines.

	vec2 pS  = 1.0 / u_texelDelta.xy;
	vec2 fp  = fract(v_texcoord0.xy*pS.xy);
	vec2 TexCoord_0 = v_texcoord0.xy-fp*u_pixelDelta.xy;
	vec2 dx  = vec2(u_texelDelta.x,0.0);
	vec2 dy  = vec2(0.0,u_texelDelta.y);
	vec2 y2  = dy + dy; vec2 x2  = dx + dx;

	vec3 A  = texture2D(sampler0, TexCoord_0 -dx -dy).xyz;
	vec3 B  = texture2D(sampler0, TexCoord_0     -dy).xyz;
	vec3 C  = texture2D(sampler0, TexCoord_0 +dx -dy).xyz;
	vec3 D  = texture2D(sampler0, TexCoord_0 -dx    ).xyz;
	vec3 E  = texture2D(sampler0, TexCoord_0        ).xyz;
	vec3 F  = texture2D(sampler0, TexCoord_0 +dx    ).xyz;
	vec3 G  = texture2D(sampler0, TexCoord_0 -dx +dy).xyz;
	vec3 H  = texture2D(sampler0, TexCoord_0     +dy).xyz;
	vec3 I  = texture2D(sampler0, TexCoord_0 +dx +dy).xyz;
	vec3 A1 = texture2D(sampler0, TexCoord_0 -dx -y2).xyz;
	vec3 C1 = texture2D(sampler0, TexCoord_0 +dx -y2).xyz;
	vec3 A0 = texture2D(sampler0, TexCoord_0 -x2 -dy).xyz;
	vec3 G0 = texture2D(sampler0, TexCoord_0 -x2 +dy).xyz;
	vec3 C4 = texture2D(sampler0, TexCoord_0 +x2 -dy).xyz;
	vec3 I4 = texture2D(sampler0, TexCoord_0 +x2 +dy).xyz;
	vec3 G5 = texture2D(sampler0, TexCoord_0 -dx +y2).xyz;
	vec3 I5 = texture2D(sampler0, TexCoord_0 +dx +y2).xyz;
	vec3 B1 = texture2D(sampler0, TexCoord_0     -y2).xyz;
	vec3 D0 = texture2D(sampler0, TexCoord_0 -x2    ).xyz;
	vec3 H5 = texture2D(sampler0, TexCoord_0     +y2).xyz;
	vec3 F4 = texture2D(sampler0, TexCoord_0 +x2    ).xyz;

	vec4 b  = vec4(dot(B ,rgbw), dot(D ,rgbw), dot(H ,rgbw), dot(F ,rgbw));
	vec4 c  = vec4(dot(C ,rgbw), dot(A ,rgbw), dot(G ,rgbw), dot(I ,rgbw));
	vec4 d  = vec4(b.y, b.z, b.w, b.x);
	vec4 e  = vec4(dot(E,rgbw));
	vec4 f  = vec4(b.w, b.x, b.y, b.z);
	vec4 g  = vec4(c.z, c.w, c.x, c.y);
	vec4 h  = vec4(b.z, b.w, b.x, b.y);
	vec4 i  = vec4(c.w, c.x, c.y, c.z);
	vec4 i4 = vec4(dot(I4,rgbw), dot(C1,rgbw), dot(A0,rgbw), dot(G5,rgbw));
	vec4 i5 = vec4(dot(I5,rgbw), dot(C4,rgbw), dot(A1,rgbw), dot(G0,rgbw));
	vec4 h5 = vec4(dot(H5,rgbw), dot(F4,rgbw), dot(B1,rgbw), dot(D0,rgbw));
	vec4 f4 = vec4(h5.y, h5.z, h5.w, h5.x);

	// These inequations define the line below which interpolation occurs.
	fx      = greaterThan(Ao*fp.y+Bo*fp.x,Co); 
	fx_left = greaterThan(Ax*fp.y+Bx*fp.x,Cx);
	fx_up   = greaterThan(Ay*fp.y+By*fp.x,Cy);

	if (VariantB==1){
		bvec4 t1        = _and_( notEqual(e, f), notEqual(e, h) );
		bvec4 t2        = _and_( not(close(f, b)), not(close(h, d)) );
		bvec4 t3        = _and_( _and_( close(e, i), not(close(f, i4)) ), not(close(h, i5)) );
		bvec4 t4        = _or_( close(e, g), close(e, c) );
		interp_restriction_lv1        = _and_( t1, _or_( _or_(t2, t3), t4 ) );
	} else {
		interp_restriction_lv1	    = bvec4(vec4(notEqual(e,f))*vec4(notEqual(e,h)));
	}
	interp_restriction_lv2_left = bvec4(vec4(notEqual(e,g))*vec4(notEqual(d,g)));
	interp_restriction_lv2_up   = bvec4(vec4(notEqual(e,c))*vec4(notEqual(b,c)));

	edr      = bvec4(vec4(lessThan(weighted_distance( e, c, g, i, h5, f4, h, f), weighted_distance( h, d, i5, f, i4, b, e, i)))*vec4(interp_restriction_lv1));
	edr_left = bvec4(vec4(lessThanEqual(coef*df(f,g),df(h,c)))*vec4(interp_restriction_lv2_left)); 
	edr_up   = bvec4(vec4(greaterThanEqual(df(f,g),coef*df(h,c)))*vec4(interp_restriction_lv2_up));
	
	nc.x = ( edr.x && (fx.x || edr_left.x && fx_left.x || edr_up.x && fx_up.x) );
	nc.y = ( edr.y && (fx.y || edr_left.y && fx_left.y || edr_up.y && fx_up.y) );
	nc.z = ( edr.z && (fx.z || edr_left.z && fx_left.z || edr_up.z && fx_up.z) );
	nc.w = ( edr.w && (fx.w || edr_left.w && fx_left.w || edr_up.w && fx_up.w) );

	px = lessThanEqual(df(e,f),df(e,h));

	vec3 res = nc.x ? px.x ? F : H : nc.y ? px.y ? B : F : nc.z ? px.z ? D : B : nc.w ? px.w ? H : D : E;
	return res;
}
vec3 processBLOOM(vec3 color, vec3 colorB, int hatsu){
	#define factor       0.002 	//Default: 0.002 /just an extra tweak for the bloom slightly higher values might look better in some cases, but too much can cause artifacts
	vec4 sum = vec4(0);
	int jb;
	int diffx = samples - 1;
	int ib;
	int diffy = samples;
	vec3 bloom;
	for( ib= -diffy ;ib < diffy; ib++)
	{
		for (jb = -diffx; jb < diffx; jb++)
		{
			sum += texture2D(sampler0, v_texcoord0.xy + vec2(jb, ib)*factor) * quality;
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
	return color;
}
const mat3 RGBtoYIQ = mat3(0.299, 0.596, 0.212, 
                           0.587,-0.275,-0.523, 
                           0.114,-0.321, 0.311);

const mat3 YIQtoRGB = mat3(1.0, 1.0, 1.0,
                           0.95568806036115671171,-0.27158179694405859326,-1.1081773266826619523,
                           0.61985809445637075388,-0.64687381613840131330, 1.7050645599191817149);

const vec3 val00 = vec3( 1.2, 1.2, 1.2);
vec3 processNATURALC(vec3 color){
	vec3 c0,c1;

	c0 = texture2D(sampler0,v_texcoordNC0.xy).xyz;
	c0+=(texture2D(sampler0,v_texcoordNC0.zy).xyz)*0.25;
	c0+=(texture2D(sampler0,v_texcoordNC0.xw).xyz)*0.25;
	c0+=(texture2D(sampler0,v_texcoordNC0.zw).xyz)*0.125;

	c0+= texture2D(sampler0,v_texcoordNC1.xy).xyz;
	c0+=(texture2D(sampler0,v_texcoordNC1.zy).xyz)*0.25;
	c0+=(texture2D(sampler0,v_texcoordNC1.xw).xyz)*0.25;
	c0+=(texture2D(sampler0,v_texcoordNC1.zw).xyz)*0.125;

	c0+= texture2D(sampler0,v_texcoordNC2.xy).xyz;
	c0+=(texture2D(sampler0,v_texcoordNC2.zy).xyz)*0.25;
	c0+=(texture2D(sampler0,v_texcoordNC2.xw).xyz)*0.25;
	c0+=(texture2D(sampler0,v_texcoordNC2.zw).xyz)*0.125;

	c0+= texture2D(sampler0,v_texcoordNC3.xy).xyz;
	c0+=(texture2D(sampler0,v_texcoordNC3.zy).xyz)*0.25;
	c0+=(texture2D(sampler0,v_texcoordNC3.xw).xyz)*0.25;
	c0+=(texture2D(sampler0,v_texcoordNC3.zw).xyz)*0.125;
	c0*=0.153846153846;

	c1=RGBtoYIQ*c0;

	c1=vec3(pow(c1.x,val00.x),c1.yz*val00.yz);

	color=mix(color,YIQtoRGB*c1,ncpower);
	return color;
}
vec3 processSCANLINES(vec3 color){
	int vscan = SLV;
	vec3 colorSL=color*SLcolor;
	if(vscan==0){
		float rey = (1.0/float(SLsize)/u_pixelDelta.y);
		float posSy = v_texcoord0.y*(rey/1.0);
		float lineSy = mod(posSy,2.0);
		color=color-lineSy;
	} else {
		float rex = (1.0/float(SLsize)/u_pixelDelta.x);
		float posSx = v_texcoord0.x*(rex/1.0);
		float lineSx = mod(posSx,2.0);
		color=color-lineSx;
	}
	color=mix(color,colorSL,SLpower);
	return color;
}
vec3 processSHARPEN(vec3 color){
	color -= texture2D(sampler0, v_texcoord0.xy+0.0001).xyz*value;
	color += texture2D(sampler0, v_texcoord0.xy-0.0001).xyz*value;
	return color;
}
vec3 processS_COM_V2(vec3 color){
	#define width  (v_texcoord0.x)
	#define height (v_texcoord0.y)
	#define px (u_texelDelta.x)
	#define py (u_texelDelta.y)
	#define dx (mean * px)
	#define dy (mean * py)
	#define mean 0.6
	#define CoefOrig (1.0 + CoefBlur)
	#define CoefBlur 2.0
	#define Sharpen_val1 ((S_val0 - 1.0) / 8.0)
	vec3 S_Edge = vec3(0.2,0.2,0.2);
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
	vec3 flou = (c1 + c3 + c6 + c8 + 2.0 * (c2 + c4 + c5 + c7) + 4.0 * orig) * 0.0625;

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
	vec3 delta1 = (c3 + 2.0 * c5 + c8) - (c1 + 2.0 * c4 + c6);

	// Save some arithmetic operations to ensure PS2 compatibility
	c1 += c3;
	c6 += c8;
	// vertical gradient
	// [ -1, - 2, -1 ]
	// [  0,   0,  0 ]
	// [  1,   2,  1 ]
	vec3 delta2 = (c6 + 2.0 * c7 ) - (c1 + 2.0 * c2 );
	vec3 checkshc = sqrt(delta1 * delta1 + delta2 * delta2);
	// computation
	if (checkshc.x > S_Edge.x || checkshc.y > S_Edge.y || checkshc.z > S_Edge.z) {
		// if we have an edge, use sharpen
		vec3 scomplexv2 = orig * S_val0 - (c1 + c2 + c4 + c5 + c6 + c7 ) * Sharpen_val1;
		color=mix(color,scomplexv2,0.5);
	} else {
		// else return corrected image
		vec3 scomplexv2 = corrected;
		color=mix(color,scomplexv2,1.0);
	}
	return color;
}
vec3 processGAMMA(vec3 color){
	vec3 gam=vec3(pow(color.r,1.0/abs(correction)),pow(color.g,1.0/abs(correction)),pow(color.b,1.0/abs(correction)));
	color=mix(color,gam,1.0);
	return color;
}
vec3 processSHADEBOOST(vec3 color){
	float sat = saturation;
	float brt = brightness;
	float con = contrast;

	// Increase or decrease theese values to adjust r, g and b color channels seperately
	float AvgLumR = red;
	float AvgLumG = green;
	float AvgLumB = blue;
	
	//==========================presets
	if(SEPIA==1){
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
	return color;
}
vec3 processCOLORED(vec3 color){
	vec3 blur = color * 1.22520613262190495;
	vec3 newcolor = vec3(overlay(color.r,blur.r),
		 overlay(color.g,blur.g),
		 overlay(color.b,blur.b));
	color = mix(color, newcolor, Cpower);
	return color;
}
vec3 processMIKU(vec3 color){
	vec3 mmm = vec3(0.1, 0.1, 0.1);
	color = mix(color,mmm, 0.9);
	return color;
}
vec3 processTEST(vec3 color){
	if(v_texcoord0.x<0.5)
	{
		color.xyz=color.xyz;
	}
	else
	{
		color.xyz=texture2D(sampler0, v_texcoord0.xy).xyz;
	}
	return color;
}
vec3 processTESTANIM(vec3 color){
	float anim=(sin(u_time.x*testAspeed)+0.9)*0.55;
	if(v_texcoord0.x<anim)
	{
		color.xyz=color.xyz;
	}
	else
	{
		color.xyz=texture2D(sampler0, v_texcoord0.xy).xyz;
	}
	return color;
}
vec3 processVIGNETTE(vec3 color) {
	float distance = dot(v_texcoord0 - 0.5, v_texcoord0 - 0.5);
	distance = clamp(distance - VIpos,0.0,1.0);
	float vignette;
	if(deVi==1){
		vignette = 1.1 + distance * vsize;
	} else {
		vignette = 1.1 - distance * vsize;
	}
	color = vignette * color;
	return color;
}

const float mx = 0.325;    // start smoothing factor
const float k = -0.250;    // smoothing decrease factor
const float max_w = 0.25;  // max. smoothing weigth
const float min_w =-0.05;  // min smoothing/sharpening weigth

vec3 processxHQ(vec3 color){
	float x = u_texelDelta.x*scaleoffset;
	float y = u_texelDelta.y*scaleoffset;
	vec2 dg1 = vec2( x,y);
	vec2 dg2 = vec2(-x,y);
	vec2 sd1 = dg1*0.5;
	vec2 sd2 = dg2*0.5;
	
	vec3 c  = texture2D(sampler0, v_texcoord0.xy).xyz;
	vec3 i1 = texture2D(sampler0, v_texcoord0.xy - sd1).xyz; 
	vec3 i2 = texture2D(sampler0, v_texcoord0.xy - sd2).xyz; 
	vec3 i3 = texture2D(sampler0, v_texcoord0.xy + sd1).xyz; 
	vec3 i4 = texture2D(sampler0, v_texcoord0.xy + sd2).xyz; 
	vec3 o1 = texture2D(sampler0, v_texcoord0.xy - dg1).xyz; 
	vec3 o3 = texture2D(sampler0, v_texcoord0.xy + dg1).xyz; 
	vec3 o2 = texture2D(sampler0, v_texcoord0.xy - dg2).xyz;
	vec3 o4 = texture2D(sampler0, v_texcoord0.xy + dg2).xyz; 
	vec3 dt = vec3(1.0,1.0,1.0);
	
	float ko1 = dot(abs(o1-c),dt);
	float ko2 = dot(abs(o2-c),dt);
	float ko3 = dot(abs(o3-c),dt);
	float ko4 = dot(abs(o4-c),dt);
	float s1d = dot(abs(i1-i3),dt);
	float s2d = dot(abs(i2-i4),dt);
	float w1  = step(ko1,ko3)*s2d;
	float w2  = step(ko2,ko4)*s1d;
	float w3  = step(ko3,ko1)*s2d;
	float w4  = step(ko4,ko2)*s1d;

	c = (w1*o1+w2*o2+w3*o3+w4*o4+0.1*c)/(w1+w2+w3+w4+0.1);
	float lc = c.r+c.g+c.b+0.2;

	w1 = (i1.r+i1.g+i1.b+lc)*0.2; 
	w1 = clamp(k*dot(abs(c-i1),dt)/w1+mx,min_w,max_w);
	w2 = (i2.r+i2.g+i2.b+lc)*0.2; 
	w2 = clamp(k*dot(abs(c-i2),dt)/w2+mx,min_w,max_w);
	w3 = (i3.r+i3.g+i3.b+lc)*0.2;
	w3 = clamp(k*dot(abs(c-i3),dt)/w3+mx,min_w,max_w);
	w4 = (i4.r+i4.g+i4.b+lc)*0.2; 
	w4 = clamp(k*dot(abs(c-i4),dt)/w4+mx,min_w,max_w);

	color = w1*i1 + w2*i2 + w3*i3 + w4*i4 + (1.0-w1-w2-w3-w4)*c;
	return color;
}

vec3 processACARTOON(vec3 color){
	float x = u_pixelDelta.x;
	float y = u_pixelDelta.y;
	vec2 dg1 = vec2( x,y);
	vec2 dg2 = vec2(-x,y);
	vec2 acdx  = vec2(x,0.0);
	vec2 acdy  = vec2(0.0,y);

	vec3 c00 = texture2D(sampler0, v_texcoord0.xy - dg1).xyz; 
	vec3 c10 = texture2D(sampler0, v_texcoord0.xy - acdy).xyz; 
	vec3 c20 = texture2D(sampler0, v_texcoord0.xy + dg2).xyz; 
	vec3 c01 = texture2D(sampler0, v_texcoord0.xy - acdx).xyz; 
	vec3 c11 = texture2D(sampler0, v_texcoord0.xy).xyz; 
	vec3 c21 = texture2D(sampler0, v_texcoord0.xy + acdx).xyz; 
	vec3 c02 = texture2D(sampler0, v_texcoord0.xy - dg2).xyz; 
	vec3 c12 = texture2D(sampler0, v_texcoord0.xy + acdy).xyz; 
	vec3 c22 = texture2D(sampler0, v_texcoord0.xy + dg1).xyz; 
	vec3 dt = vec3(1.0,1.0,1.0); 

	float d1=dot(abs(c00-c22),dt);
	float d2=dot(abs(c20-c02),dt);
	float hl=dot(abs(c01-c21),dt);
	float vl=dot(abs(c10-c12),dt);

	c11 = (c11+ 0.5*(c01+c10+c21+c12)+ 0.25*(c00+c22+c20+c02))/4.0;
	float d =bb*pow(max(d1+d2+hl+vl-th,0.0),pp)/(dot(c11,dt)+0.50);
	
	float lc = 5.0*length(c11); 
	lc = 0.2*(floor(lc) + pow(fract(lc),4.0));
	c11 = 4.0*normalize(c11); 
	vec3 frct = fract(c11); frct*=frct;
	c11 = floor(c11) + frct*frct;
	c11 = 0.25*(c11)*lc; lc*=0.577;
	c11 = mix(c11,lc*dt,lc);
	color.xyz = mix(color,(1.15-d)*c11,acpower);
	return color;
}

void main() {
	vec3 color = texture2D(sampler0, v_texcoord0.xy).xyz;
	#if(FXAA==1)
		color=processFXAA(color);
	#endif
	#if(GAUSS_SQ==1)
		color=processGAUSS_SQ(color);
	#endif
	#if(GAUSS_S==1)
		color=processGAUSS_S(color);
	#endif
	#if(SHARPEN==1)
		color=processSHARPEN(color);
	#endif
	#if(S_COM_V2==1)
		color=processS_COM_V2(color);
	#endif
	#if(xHQ==1)
		color=processxHQ(color);
	#endif
	#if(xBR==1)
		color=processxBR(color);
	#endif
	#if(NATURALC==1)
		color=processNATURALC(color);
	#endif
	#if(ACARTOON==1)
		color=processACARTOON(color);
	#endif
	#if(BLOOM==1)
		vec3 colorB=color;
		int hatsu = 0;
	#if(MIKU==1)
		hatsu = 1;
		color=processMIKU(color);
	#endif
		color=processBLOOM(color, colorB, hatsu);
	#endif
	#if(COLORED==1)
		color=processCOLORED(color);
	#endif
	#if(SHADEBOOST==1)
		color = processSHADEBOOST(color);
	#endif
	#if(GAMMA==1)
		color = processGAMMA(color);
	#endif
	#if(SCANLINES==1)
		color = processSCANLINES(color);
	#endif
	#if(VIGNETTE==1)
		color = processVIGNETTE(color);
	#endif
	#if(TEST==1)
		color = processTEST(color);
	#endif
	#if(TESTANIM==1)
		color = processTESTANIM(color);
	#endif
	gl_FragColor.xyz=color;
	gl_FragColor.a = 1.0;
}
