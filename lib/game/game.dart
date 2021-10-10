import 'package:flame/components/animation_component.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/game.dart';
import 'package:flame/spritesheet.dart';

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

    final idleAnimation = spriteSheet.createAnimation(0, from: 0, to: 3, stepTime: 0.1);
    final runAnimation = spriteSheet.createAnimation(0, from: 4, to: 10, stepTime: 0.1);
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
        ParallaxImage('parallax/plx-6.png',fill: LayerFill.none),
      ]
    );
    add(_parallaxComponent);
    add(_dino);
  }
}
