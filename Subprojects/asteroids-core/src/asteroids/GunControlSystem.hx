package asteroids;

class GunControlSystem extends System {
    var objects: Family<GunControls, Gun, Position>;
    var gunControls: Wire<GunControls>;
    var guns: Wire<Gun>;
    var positions: Wire<Position>;

    var input: Wire<InputActionSystem>;
    var factory: Wire<EntityFactory>;
    var time: Wire<TimeSystem>;

    public function new() {
    }

// TODO (DK) make times gun dependent
    override function update() {
        var dt = time.deltaTime;
        for (obj in objects) {
            var control = gunControls.get(obj);
            var gun = guns.get(obj);
            var position = positions.get(obj);
            gun.shooting = input.isActive(control.trigger);
            gun.timeSinceLastShot += dt;

            if (gun.shooting && gun.timeSinceLastShot >= gun.minimumShotInterval) {
                factory.createBullet(gun, position);
                gun.timeSinceLastShot = 0;
            }
        }
    }
}
