import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;

class SpriteSheetPlayer {
  static double animSpeed = 0.05;
  static Image spriteSheetPlayerRun;
  static Image spriteSheetPlayerAttack;
  static Image spriteSheetPlayerIdle;
  static Image spriteSheetPlayerDie;
  static Image spriteSheetPlayerDamage;
  static FlameAnimation.Animation runTopLeft;
  static FlameAnimation.Animation runTopRight;
  static FlameAnimation.Animation runBottomRight;
  static FlameAnimation.Animation runBottomLeft;
  static FlameAnimation.Animation idleBottomRight;
  static FlameAnimation.Animation idleBottomLeft;
  static FlameAnimation.Animation idleTopRight;
  static FlameAnimation.Animation idleTopLeft;

  static Future load() async {
    spriteSheetPlayerRun = await Flame.images.load('human_run.png');
    spriteSheetPlayerAttack = await Flame.images.load('human_attack.png');
    spriteSheetPlayerIdle = await Flame.images.load('human_idle.png');
    spriteSheetPlayerDie = await Flame.images.load('human_die.png');
    spriteSheetPlayerDamage = await Flame.images.load('human_damage.png');
    runBottomRight = spriteSheetPlayerRun.getAnimation(
      width: 21,
      height: 21,
      count: 4,
    );
    runBottomLeft = spriteSheetPlayerRun.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 21,
    );
    runTopRight = spriteSheetPlayerRun.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 42,
    );
    runTopLeft = spriteSheetPlayerRun.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 63,
    );

    idleBottomRight = spriteSheetPlayerIdle.getAnimation(
      width: 21,
      height: 21,
      count: 16,
    );
    idleBottomLeft = spriteSheetPlayerIdle.getAnimation(
      width: 21,
      height: 21,
      count: 16,
      startDy: 21,
    );

    idleTopRight = spriteSheetPlayerIdle.getAnimation(
      width: 21,
      height: 21,
      count: 16,
      startDy: 42,
    );

    idleTopLeft = spriteSheetPlayerIdle.getAnimation(
      width: 21,
      height: 21,
      count: 16,
      startDy: 63,
    );

    return Future.value();
  }

  static FlameAnimation.Animation getAttackBottomRight() {
    return spriteSheetPlayerAttack.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      loop: false,
      stepTime: animSpeed,
    );
  }

  static FlameAnimation.Animation getAttackBottomLeft() {
    return spriteSheetPlayerAttack.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 21,
      loop: false,
      stepTime: animSpeed,
    );
  }

  static FlameAnimation.Animation getAttackTopRight() {
    return spriteSheetPlayerAttack.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 42,
      loop: false,
      stepTime: animSpeed,
    );
  }

  static FlameAnimation.Animation getAttackTopLeft() {
    return spriteSheetPlayerAttack.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 63,
      loop: false,
      stepTime: animSpeed,
    );
  }

  static FlameAnimation.Animation getDie() {
    return spriteSheetPlayerDie.getAnimation(
      width: 21,
      height: 21,
      count: 12,
      loop: false,
    );
  }

  static FlameAnimation.Animation getDamageTopRight() {
    return spriteSheetPlayerDamage.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      loop: false,
    );
  }

  static FlameAnimation.Animation getDamageTopLeft() {
    return spriteSheetPlayerDamage.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 21,
      loop: false,
    );
  }

  static FlameAnimation.Animation getDamageBottomRight() {
    return spriteSheetPlayerDamage.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 42,
      loop: false,
    );
  }

  static FlameAnimation.Animation getDamageBottomLeft() {
    return spriteSheetPlayerDamage.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 63,
      loop: false,
    );
  }
}
