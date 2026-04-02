#version 330 compatibility

uniform sampler2D colortex0;
uniform sampler2D colortex1;

in vec2 texcoord;
const int flip = 0;
const int colshift = 0;

/* RENDERTARGETS: 0 */
layout(location = 0) out vec4 color;

void main() {
	vec2 uv = texcoord;

	if (flip == 1){
		uv.y = 1.0 - uv.y;
	}



	color =  vec4(
		texture(colortex0, uv).r,
		texture(colortex0, uv + colshift).g,
		texture(colortex0, uv - colshift).b,
		1.0
	);
}