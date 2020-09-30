import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;

class SpriteSheetOrc {
  static double animSpeed = 0.05;
  static Image spriteSheetOrcRun;
  static Image spriteSheetOrcAttack;
  static Image spriteSheetOrcIdle;
  static Image spriteSheetOrcDamage;
  static Image spriteSheetOrcDie;

  static Future load() async {
    spriteSheetOrcRun = await Flame.images.load('orc_run.png');
    spriteSheetOrcAttack = await Flame.images.load('orc_attack.png');
    spriteSheetOrcIdle = await Flame.images.load('orc_idle.png');
    spriteSheetOrcDamage = await Flame.images.load('orc_damage.png');
    spriteSheetOrcDie = await Flame.images.load('orc_die.png');
  }

  static FlameAnimation.Animation getRunBottomRight() {
    return spriteSheetOrcRun.getAnimation(
      width: 21,
      height: 21,
      count: 4,
    );
  }

  static FlameAnimation.Animation getRunBottomLeft() {
    return spriteSheetOrcRun.getAnimation(
        width: 21, height: 21, count: 4, startDy: 21);
  }

  static FlameAnimation.Animation getRunTopRight() {
    return spriteSheetOrcRun.getAnimation(
        width: 21, height: 21, count: 4, startDy: 42);
  }

  static FlameAnimation.Animation getRunTopLeft() {
    return spriteSheetOrcRun.getAnimation(
        width: 21, height: 21, count: 4, startDy: 63);
  }

  static FlameAnimation.Animation getIdleBottomRight() {
    return spriteSheetOrcIdle.getAnimation(
      width: 21,
      height: 21,
      count: 16,
    );
  }

  static FlameAnimation.Animation getIdleBottomLeft() {
    return spriteSheetOrcIdle.getAnimation(
        width: 21, height: 21, count: 16, startDy: 21);
  }

  static FlameAnimation.Animation getIdleTopRight() {
    return spriteSheetOrcIdle.getAnimation(
        width: 21, height: 21, count: 16, startDy: 42);
  }

  static FlameAnimation.Animation getIdleTopLeft() {
    return spriteSheetOrcIdle.getAnimation(
        width: 21, height: 21, count: 16, startDy: 63);
  }

  static FlameAnimation.Animation getAttackBottomRight() {
    return spriteSheetOrcAttack.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      loop: false,
      stepTime: animSpeed,
    );
  }

  static FlameAnimation.Animation getAttackBottomLeft() {
    return spriteSheetOrcAttack.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 21,
      loop: false,
      stepTime: animSpeed,
    );
  }

  static FlameAnimation.Animation getAttackTopRight() {
    return spriteSheetOrcAttack.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 42,
      loop: false,
      stepTime: animSpeed,
    );
  }

  static FlameAnimation.Animation getAttackTopLeft() {
    return spriteSheetOrcAttack.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 63,
      loop: false,
      stepTime: animSpeed,
    );
  }

  static FlameAnimation.Animation getDamageBottomRight() {
    return spriteSheetOrcDamage.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      loop: false,
    );
  }

  static FlameAnimation.Animation getDamageBottomLeft() {
    return spriteSheetOrcDamage.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 21,
      loop: false,
    );
  }

  static FlameAnimation.Animation getDamageTopRight() {
    return spriteSheetOrcDamage.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 42,
      loop: false,
    );
  }

  static FlameAnimation.Animation getDamageTopLeft() {
    return spriteSheetOrcDamage.getAnimation(
      width: 21,
      height: 21,
      count: 4,
      startDy: 63,
      loop: false,
    );
  }

  static FlameAnimation.Animation getDie() {
    return spriteSheetOrcDie.getAnimation(
      width: 21,
      height: 21,
      count: 12,
      loop: false,
    );
  }
}
