package stardust;

import asteroids.*;

class Bootstrapper extends iron.Trait {
	var asteroids: Asteroids;

	public function new() {
		super();

		// (DK) should work as armory adds all assets with { notInList: true }, so this should only load our 2d stuff
		kha.Assets.loadEverything(function() {
			asteroids = new Asteroids();
			notifyOnRender2D(asteroids.draw);
		});
	}
}
