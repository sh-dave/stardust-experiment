package asteroids.vec;

import kha.math.Vector2;

class VectorSpatialFactory extends Service {
    var spatials: Wire<VectorSpatial>;

    public function new() {
    }

    public function create( id: String, world: World, e: Entity ) {
        var spatial = spatials.create(e);

        switch id.split('-') {
            case ['asteroid', radius]:
                var r = Std.parseFloat(radius);
                var angle = 0.0;
                spatial.color = kha.Color.Red;
                spatial.poly = [];
                while (angle < Math.PI * 2) {
                    var l = (0.75 + Math.random() * 0.25) * r;
                    var x = Math.cos(angle) * l;
                    var y = Math.sin(angle) * l;
                    spatial.poly.push(new Vector2(x, y));
                    angle += Math.random() * 0.75;
                }
            case ['bullet']:
                spatial.color = kha.Color.Green;
                spatial.poly = [
                    new Vector2(0, 0),
                    new Vector2(1, 0),
                    new Vector2(1, 1),
                    new Vector2(0, 1),
                ];
            case ['spaceship']:
                spatial.color = kha.Color.White;
                spatial.poly = [
                    new Vector2(10, 0),
                    new Vector2(-6, 7),
                    new Vector2(-3, 0),
                    new Vector2(-6, -7),
                    new Vector2(10, 0),
                ];
        }

        world.commit(e);
    }
}
