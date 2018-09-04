package asteroids;

class Motion extends AutoComp<MotionData> {
}

private class MotionData {
    public var vx = 0.0;
    public var vy = 0.0;

    public var angularVelocityX = 0.0;
    public var angularVelocityY = 0.0;
    public var angularVelocityZ = 0.0;
    public var damping = 0.0; // TODO (DK) into powerup?

    public function new() {
    }
}
