import 'dart:ui';

import 'package:bonfire/bonfire.dart';

class SpriteSheetPlayer {
  static double animSpeed = 0.05;
  static Image spriteSheetPlayerRun;
  static Image spriteSheetPlayerAttack;
  static Image spriteSheetPlayerIdle;
  static Image spriteSheetPlayerDie;
  static Image spriteSheetPlayerDamage;
  static Future<SpriteAnimation> runTopLeft;
  static Future<SpriteAnimation> runTopRight;
  static Future<SpriteAnimation> runBottomRight;
  static Future<SpriteAnimation> runBottomLeft;
  static Future<SpriteAnimation> idleBottomRight;
  static Future<SpriteAnimation> idleBottomLeft;
  static Future<SpriteAnimation> idleTopRight;
  static Future<SpriteAnimation> idleTopLeft;

  static Future load() async {
    spriteSheetPlayerRun = await Flame.images.load('human_run.png');
    spriteSheetPlayerAttack = await Flame.images.load('human_attack.png');
    spriteSheetPlayerIdle = await Flame.images.load('human_idle.png');
    spriteSheetPlayerDie = await Flame.images.load('human_die.png');
    spriteSheetPlayerDamage = await Flame.images.load('human_damage.png');
    runBottomRight = spriteSheetPlayerRun
        .getAnimation(
          size: Vector2.all(21),
          count: 4,
        )
        .asFuture();
    runBottomLeft = spriteSheetPlayerRun
        .getAnimation(
          size: Vector2.all(21),
          count: 4,
          startDy: 21,
        )
        .asFuture();
    runTopRight = spriteSheetPlayerRun
        .getAnimation(
          size: Vector2.all(21),
          count: 4,
          startDy: 42,
        )
        .asFuture();
    runTopLeft = spriteSheetPlayerRun
        .getAnimation(
          size: Vector2.all(21),
          count: 4,
          startDy: 63,
        )
        .asFuture();

    idleBottomRight = spriteSheetPlayerIdle
        .getAnimation(
          size: Vector2.all(21),
          count: 16,
        )
        .asFuture();
    idleBottomLeft = spriteSheetPlayerIdle
        .getAnimation(
          size: Vector2.all(21),
          count: 16,
          startDy: 21,
        )
        .asFuture();

    idleTopRight = spriteSheetPlayerIdle
        .getAnimation(
          size: Vector2.all(21),
          count: 16,
          startDy: 42,
        )
        .asFuture();

    idleTopLeft = spriteSheetPlayerIdle
        .getAnimation(
          size: Vector2.all(21),
          count: 16,
          startDy: 63,
        )
        .asFuture();

    return Future.value();
  }

  static Future<SpriteAnimation> getAttackBottomRight() {
    return spriteSheetPlayerAttack
        .getAnimation(
          size: Vector2.all(21),
          count: 4,
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getAttackBottomLeft() {
    return spriteSheetPlayerAttack
        .getAnimation(
          size: Vector2.all(21),
          count: 4,
          startDy: 21,
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getAttackTopRight() {
    return spriteSheetPlayerAttack
        .getAnimation(
          size: Vector2.all(21),
          count: 4,
          startDy: 42,
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getAttackTopLeft() {
    return spriteSheetPlayerAttack
        .getAnimation(
          size: Vector2.all(21),
          count: 4,
          startDy: 63,
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDie() {
    return spriteSheetPlayerDie
        .getAnimation(
          size: Vector2.all(21),
          count: 12,
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageTopRight() {
    return spriteSheetPlayerDamage
        .getAnimation(
          size: Vector2.all(21),
          count: 4,
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageTopLeft() {
    return spriteSheetPlayerDamage
        .getAnimation(
          size: Vector2.all(21),
          count: 4,
          startDy: 21,
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageBottomRight() {
    return spriteSheetPlayerDamage
        .getAnimation(
          size: Vector2.all(21),
          count: 4,
          startDy: 42,
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageBottomLeft() {
    return spriteSheetPlayerDamage
        .getAnimation(
          size: Vector2.all(21),
          count: 4,
          startDy: 63,
          loop: false,
        )
        .asFuture();
  }
}
