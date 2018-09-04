package asteroids;

#if iron
class SpatialData {
    public var object: iron.Object;

    public function new() {
    }
}
#else
class SpatialData {
    public var object: kha.Image;

    public function new() {
    }
}
#end
