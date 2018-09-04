package asteroids;

class GameState extends AutoComp<GameStateData> {
}

private class GameStateData {
    public var lives = 3;
    public var level = 0;
    public var score = 0;

    public function new() {
    }
}
