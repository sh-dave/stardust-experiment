package asteroids.sprite;

import asteroids.*;
import kha.math.FastMatrix3;

class SpriteSpatialRenderSystem extends System {
    var objects: Family<SpriteSpatial, Position>;
    var positions: Wire<Position>;
    var spatials: Wire<SpriteSpatial>;

    public function new() {
    }

    public function draw( g2: kha.graphics2.Graphics ) {
        g2.color = kha.Color.White;

        for (obj in objects) {
            var spatial = spatials.get(obj);
            var position = positions.get(obj);
            var tw = spatial.object.width;
            var th = spatial.object.height;

            if (spatial.object != null) {
                var m = FastMatrix3.translation(position.x, position.y)
                    .multmat(FastMatrix3.rotation(position.rotationX))
                    .multmat(FastMatrix3.scale(spatial.scale, spatial.scale))
                    .multmat(FastMatrix3.translation(-tw / 2, -th / 2))
                    ;

                g2.pushTransformation(m);
                    g2.drawImage(spatial.object, 0, 0);
                g2.popTransformation();
            }
        }
    }
}
