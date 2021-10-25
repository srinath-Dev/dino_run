import 'dart:ui';

import 'package:DinoWarrior/game/constants.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';


class Dino extends AnimationComponent {
  late Animation _runAnimation;
  late Animation _hitAnimation;
  double speedY = 0.0;
  double yMax = 0.0;



  Dino() : super.empty() {
    final spriteSheet = SpriteSheet(
        imageName: 'DinoSprites - tard.png',
        textureWidth: 24,
        textureHeight: 24,
        columns: 24,
        rows: 1);

    _runAnimation =
        spriteSheet.createAnimation(0, from: 4, to: 10, stepTime: 0.1);
    _hitAnimation =
        spriteSheet.createAnimation(0, from: 14, to: 16, stepTime: 0.1);
    this.animation = _runAnimation;
  }

  @override
  void update(double t) {
    super.update(t);
    //final velocity  = initial velocity + gravity * time;
    // v = u + at;
    this.speedY += Gravity * t;

    //d =  s0 + s*t
    this.y += this.speedY * t;

    if(isOnGround()){
      this.y = this.yMax;
      this.speedY = 0.0;
    }
  }

  bool isOnGround(){
    return (this.y >= this.yMax);
  }

  @override
  void resize(Size size) {
    super.resize(size);
    this.height = this.width = size.width / numberOfTilesAlongWidth;
    this.x = this.width;
    this.y = size.height - groundHeight - this.height + dinoTopBottomSpacing;
    this.yMax = this.y;
  }

  void run() {
    this.animation = _runAnimation;
  }

  void hit() {
    this.animation = _hitAnimation;
  }

  void jump() {
    if(isOnGround()){
      this.speedY = -600;
    }
  }
}
