package asteroids.vec;

import asteroids.*;
import kha.math.FastMatrix3;

class VectorSpatialRenderSystem extends System {
    var objects: Family<VectorSpatial, Position>;
    var positions: Wire<Position>;
    var spatials: Wire<VectorSpatial>;

    public function new() {
    }

    public function draw( g2: kha.graphics2.Graphics ) {
        for (obj in objects) {
            var spatial = spatials.get(obj);
            var position = positions.get(obj);

            var m = FastMatrix3.translation(position.x, position.y).multmat(FastMatrix3.rotation(position.rotationX));
            g2.pushTransformation(m);
                g2.color = spatial.color;
                kha.graphics2.GraphicsExtension.drawPolygon(g2, 0, 0, spatial.poly, 1);
            g2.popTransformation();
        }
    }
}
