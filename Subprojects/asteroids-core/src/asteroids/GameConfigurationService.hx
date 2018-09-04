package asteroids;

class GameConfigurationService extends Service {
    public var width = 960;
    public var height = 540;

    public function new() {
    }

    // TODO (DK) this doesn't work anymore in kha
    override function initialize() {
        // width = kha.Window.get(0).width;
        // height = kha.Window.get(0).height;
    }
}
