import 'package:bonfire/bonfire.dart';

class SpriteSheetPlayer {
  static double animSpeed = 0.05;
  static late Image spriteSheetPlayerRun;
  static late Image spriteSheetPlayerAttack;
  static late Image spriteSheetPlayerIdle;
  static late Image spriteSheetPlayerDie;
  static late Image spriteSheetPlayerDamage;
  static late SpriteAnimation runTopLeft;
  static late SpriteAnimation runTopRight;
  static late SpriteAnimation runBottomRight;
  static late SpriteAnimation runBottomLeft;
  static late SpriteAnimation idleBottomRight;
  static late SpriteAnimation idleBottomLeft;
  static late SpriteAnimation idleTopRight;
  static late SpriteAnimation idleTopLeft;

  static Future load() async {
    spriteSheetPlayerRun = await Flame.images.load('human_run.png');
    spriteSheetPlayerAttack = await Flame.images.load('human_attack.png');
    spriteSheetPlayerIdle = await Flame.images.load('human_idle.png');
    spriteSheetPlayerDie = await Flame.images.load('human_die.png');
    spriteSheetPlayerDamage = await Flame.images.load('human_damage.png');
    runBottomRight = spriteSheetPlayerRun.getAnimation(
      size: Vector2.all(21),
      amount: 4,
    );
    runBottomLeft = spriteSheetPlayerRun.getAnimation(
      size: Vector2.all(21),
      amount: 4,
      position: Vector2(0, 21),
    );
    runTopRight = spriteSheetPlayerRun.getAnimation(
      size: Vector2.all(21),
      amount: 4,
      position: Vector2(0, 42),
    );
    runTopLeft = spriteSheetPlayerRun.getAnimation(
      size: Vector2.all(21),
      amount: 4,
      position: Vector2(0, 63),
    );

    idleBottomRight = spriteSheetPlayerIdle.getAnimation(
      size: Vector2.all(21),
      amount: 16,
    );
    idleBottomLeft = spriteSheetPlayerIdle.getAnimation(
      size: Vector2.all(21),
      amount: 16,
      position: Vector2(0, 21),
    );

    idleTopRight = spriteSheetPlayerIdle.getAnimation(
      size: Vector2.all(21),
      amount: 16,
      position: Vector2(0, 42),
    );

    idleTopLeft = spriteSheetPlayerIdle.getAnimation(
      size: Vector2.all(21),
      amount: 16,
      position: Vector2(0, 63),
    );

    return Future.value();
  }

  static Future<SpriteAnimation> getAttackBottomRight() {
    return spriteSheetPlayerAttack
        .getAnimation(
          size: Vector2.all(21),
          amount: 4,
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getAttackBottomLeft() {
    return spriteSheetPlayerAttack
        .getAnimation(
          size: Vector2.all(21),
          amount: 4,
          position: Vector2(0, 21),
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getAttackTopRight() {
    return spriteSheetPlayerAttack
        .getAnimation(
          size: Vector2.all(21),
          amount: 4,
          position: Vector2(0, 42),
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getAttackTopLeft() {
    return spriteSheetPlayerAttack
        .getAnimation(
          size: Vector2.all(21),
          amount: 4,
          position: Vector2(0, 63),
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDie() {
    return spriteSheetPlayerDie
        .getAnimation(
          size: Vector2.all(21),
          amount: 12,
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageTopRight() {
    return spriteSheetPlayerDamage
        .getAnimation(
          size: Vector2.all(21),
          amount: 4,
          position: Vector2(0, 42),
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageTopLeft() {
    return spriteSheetPlayerDamage
        .getAnimation(
          size: Vector2.all(21),
          amount: 4,
          position: Vector2(0, 63),
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageBottomRight() {
    return spriteSheetPlayerDamage
        .getAnimation(
          size: Vector2.all(21),
          amount: 4,
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageBottomLeft() {
    return spriteSheetPlayerDamage
        .getAnimation(
          size: Vector2.all(21),
          amount: 4,
          position: Vector2(0, 21),
          loop: false,
        )
        .asFuture();
  }
}
