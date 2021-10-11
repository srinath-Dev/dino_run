import 'package:flame/components/animation_component.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/game.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

const double groundHeight = 32;
const double dinoTopBottomSpacing = 10;
const int numberOfTilesAlongWidth = 10;

class DinoGame extends BaseGame {
  late AnimationComponent _dino;
  late ParallaxComponent _parallaxComponent;

  DinoGame() {
    _dino = AnimationComponent.empty();
    final spriteSheet = SpriteSheet(
        imageName: 'DinoSprites - tard.png',
        textureWidth: 24,
        textureHeight: 24,
        columns: 24,
        rows: 1);

    final idleAnimation =
        spriteSheet.createAnimation(0, from: 0, to: 3, stepTime: 0.1);
    final runAnimation =
        spriteSheet.createAnimation(0, from: 4, to: 10, stepTime: 0.1);
    _dino.animation = runAnimation;
    _dino.width = 80;
    _dino.height = 80;

    _dino.x = 80;
    _dino.y = 200;

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
    add(_dino);
  }

  @override
  void resize(Size size) {
    super.resize(size);
    _dino.height = _dino.width = size.width / numberOfTilesAlongWidth;
    _dino.x = _dino.width;
    _dino.y = size.height - groundHeight - _dino.height + dinoTopBottomSpacing;
  }
}
