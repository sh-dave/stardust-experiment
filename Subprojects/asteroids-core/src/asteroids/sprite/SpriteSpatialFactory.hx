package asteroids.sprite;

class SpriteSpatialFactory extends Service {
    var spatials: Wire<SpriteSpatial>;

    public function new() {
    }

    public function create( id: String, world: World, e: Entity ) {
        var spatial = spatials.create(e);

        switch id.split('-') {
            case ['asteroid', radius]:
                var rnd = Std.random(3) + 1;
                spatial.object = kha.Assets.images.get('spaceMeteors_00$rnd');
                var r = Std.parseFloat(radius);
                spatial.scale = 0.05 * (r / 10);
                // spatial.scale = Std.parseInt(radius);
            case ['bullet']:
                spatial.object = kha.Assets.images.get('spaceMissiles_001');
                spatial.scale = 0.2;
            case ['spaceship']:
                spatial.object = kha.Assets.images.get('spaceShips_008');
                spatial.scale = 0.2;
        }

        world.commit(e);
    }
}
