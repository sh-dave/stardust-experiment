#version 450
#define _Irr
#define _EnvCol
#define _Deferred
#define _CSM
#define _SMAA
#define _SSAO
#include "compiled.inc"
#include "std/gbuffer.glsl"
in vec3 wnormal;
out vec4[2] fragColor;
void main() {
vec3 n = normalize(wnormal);
	vec3 basecol;
	float roughness;
	float metallic;
	float occlusion;
	float specular;
	basecol = vec3(0.886274516582489, 0.4000000059604645, 0.2705881893634796);
	roughness = 0.0;
	metallic = 0.0;
	occlusion = 1.0;
	specular = 0.0;
	n /= (abs(n.x) + abs(n.y) + abs(n.z));
	n.xy = n.z >= 0.0 ? n.xy : octahedronWrap(n.xy);
	fragColor[0] = vec4(n.xy, packFloat(metallic, roughness), 1.0 - gl_FragCoord.z);
	fragColor[1] = vec4(basecol.rgb, packFloat2(occlusion, specular));
}
