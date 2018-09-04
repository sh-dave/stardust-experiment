package asteroids;

class GameManager extends System {
    var gameConfiguration: Wire<GameConfigurationService>;
    var factory: Wire<EntityFactory>;

    var spaceShipObjects: Family<SpaceShip>;
    var asteroidObjects: Family<Asteroid, Position, Collision>;
    var gameStateObjects: Family<GameState>;
    var gamestates: Wire<GameState>;
    var cfg: Wire<GameConfigurationService>;

    public function new() {
    }

    override function update() {
        if (gameStateObjects.length == 0) {
            factory.createGame();
            return;
        }

        var width = cfg.width;
        var height = cfg.height;

        for (obj in gameStateObjects) {
            var gs = gamestates.get(obj);

            if (spaceShipObjects.length == 0) {
                if (gs.lives > 0) {
                    var clearToAddPlayerShip = true;

            //         // TODO (DK) check if middle of screen is clear (or spawn with invul frames)

                    if (clearToAddPlayerShip) {
                        factory.createSpaceShip();
                        gs.lives -= 1;
                    }
                } else {
            //         // gameover
                }
            }

            if (asteroidObjects.length == 0) { // && bulletObjects.length == 0 && spaceshipObjects.length == 0) {
                // next level
                gs.level += 1;

                var asteroidCount = gs.level + 2;

                for (i in 0...asteroidCount) {
                    factory.createAsteroid(30, Math.random() * width, Math.random() * height);
                }
            }
        }
    }
}
