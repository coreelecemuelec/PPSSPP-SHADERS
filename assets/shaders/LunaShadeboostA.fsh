//Note  : Recommend to use PPSSPP with chain shaders for full functionality.
// This shader has 2 sets of configs, separate for in-game and video
//======================================================================================================================================================================
//=======================================================================================
//========================================IN-GAME========================================
//=======================================================================================
//COLORING FILTERS:
//================
//#define SHADEBOOST   0     	//ON:1/OFF:0 /color correction from GSdx/pcsx2 plugin, initially taken from http://irrlicht.sourceforge.net/phpBB2/viewtopic.php?t=21057 
//#define saturation   1.0   	//Default: 1.0 //negative will look like inverted colors shader
//#define brightness   1.0   	//Default: 1.0
//#define contrast     1.0   	//Default: 1.0 //negative will be... well negative;p
//================
//=======================================================================================
//=========================================VIDEO=========================================
//=======================================================================================
//COLORING FILTERS:
//================
//#define SHADEBOOSTv  0     	//ON:1/OFF:0 /color correction from GSdx/pcsx2 plugin, initially taken from http://irrlicht.sourceforge.net/phpBB2/viewtopic.php?t=21057 
//#define saturationv  1.0   	//Default: 1.0 //negative will look like inverted colors shader
//#define brightnessv  1.0   	//Default: 1.0
//#define contrastv    1.0   	//Default: 1.0 //negative will be... well negative;p
//#define redv         1.0   	//Default: 1.0
//#define greenv       1.0   	//Default: 1.0
//#define bluev        1.0   	//Default: 1.0
//Shadeboost presets:		//Shadeboost must be activated, presets override options above
//#define SEPIAv       0	   	//Moody coolors:)
//#define GRAYSCALEv   0	   	//Just for lols?
//#define NEGATIVEv    0	   	//As above
//#define PSPCOLORSv   0     	//Makes the colors as on older PSP screens(colder)
//Simple color swap:		//Shadeboost must be activated
//#define rgbRBGv      0     	//green <-> blue
//#define rgbBGRv      0     	//red <-> blue
//#define rgbBRGv      0     	//red -> green -> blue -> red
//#define rgbGRBv      0     	//red <-> green
//#define rgbGBRv      0     	//red -> blue -> green -> red
//^All presets and color swap are simple switch ON:1/OFF:0
//================
//Approximate performance hit
//Free:
//Light: COLORED, SHADEBOOST, GAMMA
//Medium: NATURALC
//Heavy: 
//Extremely Heavy: 
//======================================================================================================================================================================
//~packed together, corrected to fit requirements of popular with PPSSPP AMD legacy drivers v11.11(if it works on that, it will on almost anything lol),
// currently meet requirements of GLSL version 100 meaning it will probably run on anything unless the driver is horribly broken
// partially written, ported to glsl where required and tested by LunaMoo (Moon Cow?;p),
// other credits mentioned earlier, any more info / required licenses can be found below.





#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D sampler0;
uniform vec4 u_time;
uniform float u_video;

uniform vec4 u_setting;

//===========
// The inverse of the texture dimensions along X and Y
uniform vec2 u_texelDelta;
uniform vec2 u_pixelDelta;
varying vec2 v_texcoord0;



vec3 processSHADEBOOST(vec3 color){
	float sat = u_setting.y;
	float brt = u_setting.z;
	float con = u_setting.w;

	// Increase or decrease theese values to adjust r, g and b color channels seperately
	float AvgLumR = 1.0;
	float AvgLumG = 1.0;
	float AvgLumB = 1.0;

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

void main() {
	vec3 color = texture2D(sampler0, v_texcoord0.xy).xyz;

	if(u_setting.x==2.0 || (u_setting.x==0.0 && u_video==0.0) || (u_setting.x==1.0 && u_video==1.0)) {
		color=processSHADEBOOST(color);
	}

	gl_FragColor.xyz=color;
	gl_FragColor.a = 1.0;
}
