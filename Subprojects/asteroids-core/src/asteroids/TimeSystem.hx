package asteroids;

class TimeSystem extends System {
    public var deltaTime(default, null) = 0.0;
    public var totalTime(default, null) = 0.0;
    public var currentFrame(default, null) = 0;

    var lastTime: Float;
    var startTime: Float;

    public function new() {
    }

    override function initialize() {
        lastTime = startTime = _now();
    }

    override function update() {
        var now = _now();
        deltaTime = now - lastTime;
        totalTime = now - startTime;
        currentFrame += 1;
        lastTime = now;
    }

    inline function _now()
        return kha.Scheduler.time();
}
