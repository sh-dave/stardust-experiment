package asteroids;

class MovementControlSystem extends System {
    var objects: Family<MovementControls, PowerupState, Position, Motion>;

    var controls: Wire<MovementControls>;
    var powerups: Wire<PowerupState>;
    var positions: Wire<Position>;
    var motions: Wire<Motion>;

    var time: Wire<TimeSystem>;
    var input: Wire<InputActionSystem>;

    public function new() {
    }

    override function update() {
        var dt = time.deltaTime;

        for (obj in objects) {
            var control = controls.get(obj);
            var position = positions.get(obj);
            var motion = motions.get(obj);
            var powerup = powerups.get(obj);

            if (input.isActive(control.left)) {
                position.rotationX -= powerup.rotationRate * dt;
            }

            if (input.isActive(control.right)) {
                position.rotationX += powerup.rotationRate * dt;
            }

            if (input.isActive(control.accelerate)) {
                var nvy = motion.vy + Math.sin(position.rotationX) * powerup.accelerationRate * dt;
                trace('motion.vy ${motion.vy} -> $nvy');
                motion.vx += Math.cos(position.rotationX) * powerup.accelerationRate * dt;
                motion.vy = nvy;
            }
        }
    }
}
