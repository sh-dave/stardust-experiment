package asteroids;

import kha.math.Vector2;

class CollisionSystem extends System {
    var bulletObjects: Family<Bullet, Position, Collision>;
    var asteroidObjects: Family<Asteroid, Position, Collision>;

    var factory: Wire<EntityFactory>;
    var positions: Wire<Position>;
    var collisions: Wire<Collision>;

    public function new() {
    }

    override function update() {
        for (bullet in bulletObjects) {
            var bpos = positions.get(bullet);

            for (asteroid in asteroidObjects) {
                var apos = positions.get(asteroid);
                var acoll = collisions.get(asteroid);
                var bvec = new Vector2(bpos.x, bpos.y);
                var avec = new Vector2(apos.x, apos.y);
                var collided = bvec.sub(avec).length <= acoll.radius;//bvec.Math.sqrt(bpos.x * bpos.x + bpos.y * bpos.y) <= acoll.radius;

                if (collided) {
                    world.destroy(bullet);

                    if (acoll.radius > 10) {
                        factory.createAsteroid(acoll.radius - 10, apos.x + Math.random() * 10 - 5, apos.y + Math.random() * 10 - 5);
                        factory.createAsteroid(acoll.radius - 10, apos.x + Math.random() * 10 - 5, apos.y + Math.random() * 10 - 5);
                    }

                    world.destroy(asteroid);
                    break;
                }
            }
        }

        // TODO (DK) spaceship -> asteroid collision
    }
}