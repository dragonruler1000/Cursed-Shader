#version 330 compatibility

uniform sampler2D colortex0;
uniform sampler2D colortex1;

in vec2 texcoord;
uniform int flip = 0;
#define uniform int colshift = 0;
uniform float aberation = 0;

/* RENDERTARGETS: 0 */
layout(location = 0) out vec4 color;

void main() {
	vec2 uv = texcoord;

	if (flip == 1){
		uv.y = 1.0 - uv.y;
	}
	if (colshift == 1){
		aberation = 0.1;
	}



	color =  vec4(
		texture(colortex0, uv).r,
		texture(colortex0, uv + aberation).g,
		texture(colortex0, uv - aberation).b,
		1.0
	);
}