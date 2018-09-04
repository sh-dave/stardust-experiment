package asteroids;

class MovementSystem extends System {
    var objects: Family<Position, Motion>;

    var positions: Wire<Position>;
    var motions: Wire<Motion>;
    var time: Wire<TimeSystem>;
    var cfg: Wire<GameConfigurationService>;

    public function new() {
    }

    override function update() {
        var dt = time.deltaTime;
        var width = cfg.width;
        var height = cfg.height;

        for (obj in objects) {
            var position = positions.get(obj);
            var motion = motions.get(obj);
            position.x += motion.vx * dt;
            position.y += motion.vy * dt;
            position.rotationX += motion.angularVelocityX * dt;
            position.rotationY += motion.angularVelocityY * dt;
            position.rotationZ += motion.angularVelocityZ * dt;

            if (position.x < 0) {
                position.x += width;
            }

            if (position.x > width) {
                position.x -= width;
            }

            if (position.y < 0) {
                position.y += height;
            }

            if (position.y > height) {
                position.y -= height;
            }

            if (motion.damping > 0) {
                var dx = Math.abs(Math.cos(position.rotationX) * motion.damping * dt);
                var dy = Math.abs(Math.sin(position.rotationX) * motion.damping * dt);

                if (motion.vx > dx) {
                    motion.vx -= dx;
                } else if (motion.vx < -dx) {
                    motion.vx += dx;
                } else {
                    motion.vx = 0;
                }

                if (motion.vy > dy) {
                    motion.vy -= dy;
                } else if (motion.vy < -dy) {
                    motion.vy += dy;
                } else {
                    motion.vy = 0;
                }
            }
        }
    }
}
