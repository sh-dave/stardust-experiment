// Auto-generated
let project = new Project('stardust');

project.addSources('Sources');
project.addLibrary("../armsdk/armory");
project.addLibrary("../armsdk/iron");
await project.addProject("Subprojects/asteroids-core");
project.addParameter('stardust.Bootstrapper');
project.addParameter("--macro keep('stardust.Bootstrapper')");
project.addShaders("build_stardust/compiled/Shaders/_defaultMat_001_mesh.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/_defaultMat_001_mesh.vert.glsl");
project.addShaders("build_stardust/compiled/Shaders/_defaultMat_001_shadowmap.vert.glsl");
project.addShaders("build_stardust/compiled/Shaders/_defaultMat_002_mesh.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/_defaultMat_mesh.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/_defaultMat_mesh.vert.glsl");
project.addShaders("build_stardust/compiled/Shaders/_defaultMat_shadowmap.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/_defaultMat_shadowmap.vert.glsl");
project.addShaders("build_stardust/compiled/Shaders/glass_mesh.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/metal_001_mesh.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/metal_mesh.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/pipe_mesh.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/rock_001_mesh.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/rock_002_mesh.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/rock_mesh.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/blur_edge_pass.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/compositor_pass.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/compositor_pass.vert.glsl");
project.addShaders("build_stardust/compiled/Shaders/deferred_indirect.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/deferred_indirect.vert.glsl");
project.addShaders("build_stardust/compiled/Shaders/deferred_light.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/deferred_light_quad.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/pass.vert.glsl");
project.addShaders("build_stardust/compiled/Shaders/pass_light_volume.vert.glsl");
project.addShaders("build_stardust/compiled/Shaders/pass_viewray.vert.glsl");
project.addShaders("build_stardust/compiled/Shaders/smaa_blend_weight.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/smaa_blend_weight.vert.glsl");
project.addShaders("build_stardust/compiled/Shaders/smaa_edge_detect.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/smaa_edge_detect.vert.glsl");
project.addShaders("build_stardust/compiled/Shaders/smaa_neighborhood_blend.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/smaa_neighborhood_blend.vert.glsl");
project.addShaders("build_stardust/compiled/Shaders/ssao_pass.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/world_pass.frag.glsl");
project.addShaders("build_stardust/compiled/Shaders/world_pass.vert.glsl");
project.addAssets("build_stardust/compiled/Shaders/_defaultMat_001_data.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Shaders/_defaultMat_002_data.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Shaders/_defaultMat_data.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Shaders/glass_data.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Shaders/metal_001_data.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Shaders/metal_data.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Shaders/pipe_data.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Shaders/rock_001_data.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Shaders/rock_002_data.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Shaders/rock_data.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Shaders/shader_datas.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Assets/Scene.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Assets/envmaps/World_irradiance.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Assets/meshes/mesh_barrel.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Assets/meshes/mesh_meteorFull.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Assets/meshes/mesh_meteorFullRound.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Assets/meshes/mesh_meteorHalf.arm", { notinlist: true });
project.addAssets("build_stardust/compiled/Assets/meshes/mesh_spaceCraft6_8angles.arm", { notinlist: true });
project.addAssets("armsdk/armory/Assets/brdf.png", { notinlist: true });
project.addAssets("armsdk/armory/Assets/noise8.png", { notinlist: true });
project.addAssets("armsdk/armory/Assets/smaa_area.png", { notinlist: true });
project.addAssets("armsdk/armory/Assets/smaa_search.png", { notinlist: true });
project.addDefine('arm_deferred');
project.addDefine('arm_csm');
project.addDefine('rp_hdr');
project.addDefine('rp_renderer=Deferred');
project.addDefine('rp_depthprepass');
project.addDefine('rp_shadowmap');
project.addDefine('rp_shadowmap_size=1024');
project.addDefine('rp_background=World');
project.addDefine('rp_render_to_texture');
project.addDefine('rp_compositornodes');
project.addDefine('rp_antialiasing=SMAA');
project.addDefine('rp_supersampling=1');
project.addDefine('rp_gi=Off');
project.addDefine('rp_ssgi=SSAO');
project.addDefine('arm_shaderload');
project.addDefine('arm_soundcompress');
project.addDefine('arm_skin');
project.addDefine('arm_particles_gpu');
project.addDefine('arm_particles');
project.addDefine('arm_fast');


resolve(project);