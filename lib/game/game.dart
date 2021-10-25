import 'package:DinoWarrior/game/dino.dart';
import 'package:DinoWarrior/game/enemy.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

class DinoGame extends BaseGame with TapDetector{
  late Dino _dino;
  late ParallaxComponent _parallaxComponent;

  DinoGame() {
    _parallaxComponent = ParallaxComponent(
      [
        ParallaxImage('parallax/plx-1.png'),
        ParallaxImage('parallax/plx-2.png'),
        ParallaxImage('parallax/plx-3.png'),
        ParallaxImage('parallax/plx-4.png'),
        ParallaxImage('parallax/plx-5.png'),
        ParallaxImage('parallax/plx-6.png', fill: LayerFill.none),
      ],
      baseSpeed: Offset(100, 0),
      layerDelta: Offset(20, 0),
    );
    add(_parallaxComponent);
    _dino = Dino();
    add(_dino);

    var enemy = Enemy(EnemyType.Rino);
    add(enemy);
  }

  @override
  void onTapDown(TapDownDetails details) {
    super.onTapDown(details);
    _dino.jump();
  }
}
