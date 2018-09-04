package asteroids;

typedef SpatialFactory = {
    function create( id: String, w: World, e: Entity ) : Void;
}

class EntityFactory extends Service {
    var spatialFactory: SpatialFactory;
    var gameStates: Wire<GameState>;
    var asteroids: Wire<Asteroid>;
    var positions: Wire<Position>;
    var motions: Wire<Motion>;
    var guns: Wire<Gun>;
    var ages: Wire<Age>;
    var bullets: Wire<Bullet>;
    var collisions: Wire<Collision>;
    var spaceships: Wire<SpaceShip>;
    var movementControls: Wire<MovementControls>;
    var gunControls: Wire<GunControls>;
    var powerupStates: Wire<PowerupState>;
    var cfg: Wire<GameConfigurationService>;

    public function new( spatialFactory: SpatialFactory ) {
        this.spatialFactory = spatialFactory;
    }

    public function createGame() : Entity {
        var e = world.create();
        gameStates.create(e);
        world.commit(e);
        return e;
    }

    public function createSpaceShip() : Entity {
        var e = world.create();
        var position = positions.create(e);

        position.x = cfg.width / 2;
        position.y = cfg.height / 2;
        position.rotationX = 0.0;
        position.rotationY = 0.0;
        position.rotationZ = 0.0;

        // function playing( w, e ) {
            spaceships.create(e);

            var motion = motions.create(e);
            motion.vx = 0;
            motion.vy = 0;
            motion.angularVelocityX = 0.0;
            motion.angularVelocityY = 0.0;
            motion.angularVelocityZ = 0.0;
            motion.damping = 15;

            var mc = movementControls.create(e);
            mc.left = InputAction.TurnLeft;
            mc.right = InputAction.TurnRight;
            mc.accelerate = InputAction.Accelerate;
            mc.shield = InputAction.Shield;

            var pus = powerupStates.create(e);
            pus.accelerationRate = 100;
            pus.rotationRate = 3;

            var gun = guns.create(e);
            gun.offsetX = 8;
            gun.offsetY = 0;
            gun.minimumShotInterval = 0.08;
            gun.bulletLifeTime = 2;
            gun.spreadAngle = 10;

            var gc = gunControls.create(e);
            gc.trigger = InputAction.Fire;

            var collision = collisions.create(e);
            collision.radius = 9;

            spatialFactory.create('spaceship', world, e);
        // }

        // function cleanupPlaying( w, e ) {
        //     spaceships.destroy(e);
        //     motions.destroy(e);
        //     movementControls.destroy(e);
        //     guns.destroy(e);
        //     gunControls.destroy(e);
        //     collisions.destroy(e);
        //     spatialFactory.destroy(e);
        // }

        // function destroyed( w, e ) {
        //     ages.create(e).lifeRemaining = 5;
        //     // animations.create(e).
        //     spatialFactory.create('spaceship-destroyed', e);
        // }

        // function cleanupDestroyed( w, e ) {
        //     ages.destroy(e);
        //     // animations.destroy(e);
        //     spatialFactory.destroy(e); // TODO (DK) pass 'spaceship-destroyed' ?
        // }

        // fsm.addState('playing', playing, cleanupPlaying);
        // fsm.addState('destroyed', destroyed, cleanupDestroyed);

        // TODO (DK) fsm.setState('playing');

        return e;
    }

    public function createAsteroid( r, x, y ) : Entity {
        var e = world.create();
        asteroids.create(e);

        var position = positions.create(e);
        position.x = x;
        position.y = y;
        position.rotationX = 0.0;

        var collision = collisions.create(e);
        collision.radius = r;

        var motion = motions.create(e);
        motion.vx = (Math.random() - 0.5) * 4 * (50 - r);
        motion.vy = (Math.random() - 0.5) * 4 * (50 - r);
        motion.angularVelocityX = Math.random() * 2 - 1;
        motion.angularVelocityY = Math.random() * 2 - 1;
        motion.angularVelocityZ = Math.random() * 2 - 1;
        motion.damping = 0;

        spatialFactory.create('asteroid-$r', world, e);

        return e;
    }

    public function createBullet( gun: GunData, parent: PositionData ) : Entity {
        var rotation = parent.rotationX + gun.spreadAngle * (Math.random() - 0.5) * Math.PI / 180;
        var cos = Math.cos(rotation);
        var sin = Math.sin(rotation);

        var e = world.create();
        bullets.create(e);

        var position = positions.create(e);
        position.x = cos * gun.offsetX - sin * gun.offsetX + parent.x;
        position.y = sin * gun.offsetY + cos * gun.offsetY + parent.y;
        position.rotationX = parent.rotationX;
        position.rotationY = 0;
        position.rotationZ = 0;

        var collision = collisions.create(e);
		collision.radius = 0;

        var velocity = 300; // TODO (DK) gun velocity? or powerups?
        var motion = motions.create(e);
        motion.vx = cos * velocity;
        motion.vy = sin * velocity;
        motion.angularVelocityX = 0.0;
        motion.angularVelocityY = 0.0;
        motion.angularVelocityZ = 0.0;
        motion.damping = 0.0;

        ages.create(e).lifeRemaining = gun.bulletLifeTime;

        spatialFactory.create('bullet', world, e);

        return e;
    }
}
