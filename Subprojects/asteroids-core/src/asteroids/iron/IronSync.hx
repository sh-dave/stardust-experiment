package asteroids.iron;

class IronSync extends System {
    var objects: Family<IronSpatial, Position>;
    var spatials: Wire<IronSpatial>;
    var positions: Wire<Position>;

    public function new() {
    }

    override function update() {
        for (obj in objects) {
            var spatial = spatials.get(obj);
            var position = positions.get(obj);
            spatial.object.transform.loc.set(position.x / 100, -position.y / 100, 0);
            // spatial.object.transform.setRotation(0, 0, -position.rotationX);
            spatial.object.transform.setRotation(position.rotationZ, position.rotationY, -position.rotationX); // TODO (DK) check me
            spatial.object.transform.buildMatrix();
        }
    }
}
