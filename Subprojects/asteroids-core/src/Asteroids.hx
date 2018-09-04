package;

private enum RenderMode {
    Vector;
    Textured;
    Iron;
}

class Asteroids {
    var world: World;

    var vecRenderer: asteroids.vec.VectorSpatialRenderSystem;
    var vecFactory: asteroids.vec.VectorSpatialFactory;

    var spriteRenderer: asteroids.sprite.SpriteSpatialRenderSystem;
    var spriteFactory: asteroids.sprite.SpriteSpatialFactory;

    var ironFactory: asteroids.iron.IronSpatialFactory;
    var ironRenderer: asteroids.iron.IronSpatialRenderSystem;

    var renderMode = Vector;

    public function new() {
        var cfg = new WorldConfig();

        cfg.add(new ecx.common.systems.SystemRunner());
        cfg.add(new asteroids.TimeSystem(), -1000);

        cfg.add(new asteroids.GameConfigurationService(), -1000);
        cfg.add(new asteroids.UpdateService());
        cfg.add(new asteroids.InputActionSystem());

        cfg.add(new asteroids.EntityFactory({
            create: function( id: String, w: World, e: Entity ) {
                vecFactory.create(id, w, e);
                spriteFactory.create(id, w, e);
                ironFactory.create(id, w, e);
            }
        }));

        cfg.add(new asteroids.AgeSystem(), 2);
        cfg.add(new asteroids.GameManager(), 1);
        cfg.add(new asteroids.GunControlSystem(), 2);
        cfg.add(new asteroids.MovementControlSystem(), 2);
        cfg.add(new asteroids.MovementSystem(), 3);
        cfg.add(new asteroids.CollisionSystem(), 4);
        // cfg.add(new asteroids.AnimationSystem(), 6);

        cfg.add(vecFactory = new asteroids.vec.VectorSpatialFactory());
        cfg.add(vecRenderer = new asteroids.vec.VectorSpatialRenderSystem(), 7);
        cfg.add(new asteroids.vec.VectorSpatial());

        cfg.add(spriteFactory = new asteroids.sprite.SpriteSpatialFactory());
        cfg.add(spriteRenderer = new asteroids.sprite.SpriteSpatialRenderSystem(), 7);
        cfg.add(new asteroids.sprite.SpriteSpatial());

        cfg.add(ironFactory = new asteroids.iron.IronSpatialFactory(iron.Scene.active), 1);
        cfg.add(new asteroids.iron.IronSpatial());
        cfg.add(new asteroids.iron.IronSync(), 4);

        cfg.add(new asteroids.Age());
        cfg.add(new asteroids.Asteroid());
        cfg.add(new asteroids.Bullet());
        cfg.add(new asteroids.Collision());
        cfg.add(new asteroids.GameState());
        cfg.add(new asteroids.Gun());
        cfg.add(new asteroids.GunControls());
        cfg.add(new asteroids.Motion());
        cfg.add(new asteroids.MovementControls());
        cfg.add(new asteroids.Position());
        cfg.add(new asteroids.PowerupState());
        cfg.add(new asteroids.SpaceShip());

        world = Engine.createWorld(cfg, 1000);

        // kha.System.notifyOnFrames(function( fbs ) {
        //     var fb = fbs[0];
        //     var g2 = fb.g2;

        //     switch renderMode {
        //         case Vector:
        //             g2.begin(true, kha.Color.Black);
        //             g2.end();
        //             vecRenderer.renderTo(fb);
        //         case Textured:
        //             g2.begin(true, kha.Color.Black);
        //             g2.end();
        //             spriteRenderer.renderTo(fb);
        //         case Iron:
        //     }

        //     g2.begin(false);
        //         g2.font = kha.Assets.fonts.kenvector_future;
        //         g2.fontSize = 12;
        //         g2.color = kha.Color.Orange;
        //         g2.drawString('1...VECTOR  |  2...SPRITES  |  3...3D', 16, 16);
        //     g2.end();
        // });

        kha.input.Keyboard.get().notify(function( code ) {
            switch code {
                case kha.input.KeyCode.One:
                    renderMode = Vector;
                case kha.input.KeyCode.Two:
                    renderMode = Textured;
                case kha.input.KeyCode.Three:
                    renderMode = Iron;
                default:
            }
        }, null);
    }

    public function draw( g2: kha.graphics2.Graphics ) {
        switch renderMode {
            case Vector:
                g2.clear(kha.Color.Black);
                vecRenderer.draw(g2);
            case Textured:
                g2.clear(kha.Color.Black);
                spriteRenderer.draw(g2);
            case Iron:
        }

        g2.font = kha.Assets.fonts.kenvector_future;
        g2.fontSize = 12;
        g2.color = kha.Color.Orange;
        g2.drawString('<1> ... VECTOR', 16, 16);
        g2.drawString('<2> ... SPRITES', 16, 32);
        g2.drawString('<3> ... 3D', 16, 48);
    }
}
