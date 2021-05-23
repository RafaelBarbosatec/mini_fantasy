import 'dart:ui';

import 'package:bonfire/bonfire.dart';

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

  static Future<SpriteAnimation> getRunBottomRight() {
    return spriteSheetOrcRun
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getRunBottomLeft() {
    return spriteSheetOrcRun
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 21,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getRunTopRight() {
    return spriteSheetOrcRun
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 42,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getRunTopLeft() {
    return spriteSheetOrcRun
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 63,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getIdleBottomRight() {
    return spriteSheetOrcIdle
        .getAnimation(
          width: 21,
          height: 21,
          count: 16,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getIdleBottomLeft() {
    return spriteSheetOrcIdle
        .getAnimation(
          width: 21,
          height: 21,
          count: 16,
          startDy: 21,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getIdleTopRight() {
    return spriteSheetOrcIdle
        .getAnimation(
          width: 21,
          height: 21,
          count: 16,
          startDy: 42,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getIdleTopLeft() {
    return spriteSheetOrcIdle
        .getAnimation(
          width: 21,
          height: 21,
          count: 16,
          startDy: 63,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getAttackBottomRight() {
    return spriteSheetOrcAttack
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getAttackBottomLeft() {
    return spriteSheetOrcAttack
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 21,
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getAttackTopRight() {
    return spriteSheetOrcAttack
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 42,
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getAttackTopLeft() {
    return spriteSheetOrcAttack
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 63,
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageBottomRight() {
    return spriteSheetOrcDamage
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageBottomLeft() {
    return spriteSheetOrcDamage
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 21,
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageTopRight() {
    return spriteSheetOrcDamage
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 42,
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageTopLeft() {
    return spriteSheetOrcDamage
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 63,
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDie() {
    return spriteSheetOrcDie
        .getAnimation(
          width: 21,
          height: 21,
          count: 12,
          loop: false,
        )
        .asFuture();
  }
}
