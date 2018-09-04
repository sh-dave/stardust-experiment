package asteroids;

class AgeSystem extends System {
    var time: Wire<TimeSystem>;
    var ages: Wire<Age>;

    var objects: Family<Age>;

    public function new() {
    }

    override function update() {
        var dt = time.deltaTime;

        for (obj in objects) {
            var age = ages.get(obj);
            age.lifeRemaining -= dt;

            if (age.lifeRemaining <= 0) {
                world.destroy(obj);
            }
        }
    }
}
