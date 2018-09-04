package asteroids;

import ecx.common.systems.SystemRunner;

class UpdateService extends Service {
    var runner: Wire<SystemRunner>;

    public function new() {
    }

    override function initialize()
        kha.Scheduler.addTimeTask(runner.updateFrame, 0, 1 / 60);
}
