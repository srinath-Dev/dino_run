import 'package:flame/components/animation_component.dart';
import 'package:flame/game.dart';
import 'package:flame/spritesheet.dart';

class DinoGame extends BaseGame {
  late AnimationComponent _dino;

  DinoGame() {
    _dino = AnimationComponent.empty();
    SpriteSheet(imageName: 'DinoSprites - tard.png',
        textureWidth: null,
        textureHeight: null,
        columns: null,
        rows: null);
    add(_dino);
  }

}