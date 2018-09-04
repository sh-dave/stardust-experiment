package asteroids.iron;

import iron.Scene;

class IronSpatialFactory extends System {
    var scene: Scene;
    var spatials: Wire<IronSpatial>;
    var objects: Family<IronSpatial>; // (DK) required to get onEntityRemoved() calls

    public function new( scene: Scene ) {
        this.scene = scene;
    }

	override function onEntityRemoved( e: Entity, _ ) {
        var spatial = spatials.get(e);
        spatial.object.remove();
        spatials.destroy(e);
    }

    public function create( id: String, world: World, e: Entity ) {
        if (scene == null) {
            return;
        }

        switch id.split('-') {
            case ['asteroid', radius]:
                var rnd = Std.random(3) + 1;
                var r = Std.parseFloat(radius);

                scene.spawnObject('asteroid-00$rnd', null, function( o ) {
                    var spatial = spatials.create(e);
                    spatial.object = o;
                    var scale = 0.1 * (r / 50);
                    spatial.object.transform.scale.set(scale, scale, scale);
                    spatial.object.transform.buildMatrix();
                    world.commit(e);
                });
            case ['bullet']:
                scene.spawnObject('bullet', null, function( o ) {
                    var spatial = spatials.create(e);
                    spatial.object = o;
                    var scale = 0.05;
                    spatial.object.transform.scale.set(scale, scale, scale);
                    spatial.object.transform.buildMatrix();
                    world.commit(e);
                });
            case ['spaceship']:
                scene.spawnObject('spaceship', null, function( o ) {
                    var spatial = spatials.create(e);
                    spatial.object = o;
                    var scale = 0.25;
                    spatial.object.transform.scale.set(scale, scale, scale);
                    spatial.object.transform.buildMatrix();
                    world.commit(e);
                });
        }
    }
}
