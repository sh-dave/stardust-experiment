package asteroids;

class MovementControls extends AutoComp<MovementControlsData> {
}

private class MovementControlsData {
    public var left: InputAction;
    public var right: InputAction;
    public var accelerate: InputAction;
    public var shield: InputAction;

    public function new() {
    }
}
