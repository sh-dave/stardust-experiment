const prj = new Project('asteroids-core');
prj.addAssets('assets/**');
prj.addLibrary('ecx');
prj.addLibrary('ecx-common');
prj.addSources('src');
resolve(prj);
