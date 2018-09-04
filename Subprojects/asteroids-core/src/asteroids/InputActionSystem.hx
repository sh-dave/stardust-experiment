package asteroids;

import kha.input.KeyCode;

class InputActionSystem extends System {
    var keys: Array<Bool> = [];

    public function new() {
    }

    // TODO (DK) should be mapped via config file
    public function isActive( action: InputAction )
        return switch action {
            case TurnLeft:
                keys[KeyCode.Left] || keys[KeyCode.A];
            case TurnRight:
                keys[KeyCode.Right] || keys[KeyCode.D];
            case Accelerate:
                keys[KeyCode.Up] || keys[KeyCode.W];
            case Shield:
                keys[KeyCode.Down] || keys[KeyCode.S];
            case Fire:
                keys[KeyCode.Space];
            case Pause:
                keys[KeyCode.Escape];
        }

    override function initialize() {
        kha.input.Keyboard.get(0).notify(keyDown, keyUp, null);
    }

    function keyDown( code ) {
        keys[code] = true;
    }

    function keyUp( code ) {
        keys[code] = false;
    }
}
