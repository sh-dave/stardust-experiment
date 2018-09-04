package asteroids;

class GunData {
    public var shooting = false;
    public var offsetX = 0.0;
    public var offsetY = 0.0;
    public var timeSinceLastShot = 0.0;
    public var minimumShotInterval = 0.0;
    public var bulletLifeTime = 0.0;
    public var spreadAngle = 0.0;

    public function new() {
    }
}
