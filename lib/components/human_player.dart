import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minifantasy/main.dart';
import 'package:minifantasy/sprite_sheet/sprite_sheet_player.dart';

class HumanPlayer extends SimplePlayer
    with Lighting, BlockMovementCollision, UseLifeBar {
  static double maxSpeed = tileSize * 4;

  bool lockMove = false;

  HumanPlayer(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteSheetPlayer.idleBottomRight,
            idleUp: SpriteSheetPlayer.idleTopRight,
            idleUpRight: SpriteSheetPlayer.idleTopRight,
            runRight: SpriteSheetPlayer.runBottomRight,
            runUpRight: SpriteSheetPlayer.runTopRight,
            runDownRight: SpriteSheetPlayer.runBottomRight,
          ),
          speed: maxSpeed,
          size: Vector2.all(tileSize * 2.9),
        ) {
    setupLighting(
      LightingConfig(
        radius: width / 2,
        blurBorder: width / 2,
        color: Colors.transparent,
      ),
    );

    setupLifeBar(
      borderRadius: BorderRadius.circular(2),
      size: Vector2(tileSize * 1.5, tileSize / 5),
      offset: Vector2(width / 8, 8),
    );

    setupMovementByJoystick(
      intensityEnabled: false,
    );
  }

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2(
          size.x * 0.2,
          size.y * 0.15,
        ),
        position: Vector2(tileSize * 1.15, tileSize * 1.5),
      ),
    );
    return super.onLoad();
  }

  @override
  void onJoystickAction(JoystickActionEvent event) {
    if (isDead || lockMove) return;
    if ((event.id == LogicalKeyboardKey.space ||
            event.id == LogicalKeyboardKey.select ||
            event.id == 1) &&
        event.event == ActionEvent.DOWN) {
      _attack();
    }
    super.onJoystickAction(event);
  }

  @override
  void onJoystickChangeDirectional(JoystickDirectionalEvent event) {
    if (lockMove || isDead) {
      return;
    }
    super.onJoystickChangeDirectional(event);
  }

  @override
  void onReceiveDamage(AttackOriginEnum attacker, double damage, identify) {
    if (!isDead) {
      this.showDamage(
        damage,
        initVelocityVertical: -2,
        config: TextStyle(color: Colors.white, fontSize: tileSize / 2),
      );

      lockMove = true;
      stopMove(forceIdle: true);
      _addDamageAnimation(() {
        lockMove = false;
      });
    }
    super.onReceiveDamage(attacker, damage, identify);
  }

  @override
  void onDie() {
    animation?.playOnce(
      SpriteSheetPlayer.getDie(),
      onFinish: () {
        removeFromParent();
      },
      runToTheEnd: true,
      useCompFlip: true,
    );
    super.onDie();
  }

  void _addAttackAnimation() {
    Future<SpriteAnimation> newAnimation;
    switch (lastDirection) {
      case Direction.left:
      case Direction.right:
        newAnimation = SpriteSheetPlayer.getAttackBottomRight();
        break;
      case Direction.up:
        if (lastDirectionHorizontal == Direction.left) {
          newAnimation = SpriteSheetPlayer.getAttackTopLeft();
        } else {
          newAnimation = SpriteSheetPlayer.getAttackTopRight();
        }

        break;
      case Direction.down:
        if (lastDirectionHorizontal == Direction.left) {
          newAnimation = SpriteSheetPlayer.getAttackBottomLeft();
        } else {
          newAnimation = SpriteSheetPlayer.getAttackBottomRight();
        }
        break;
      case Direction.upLeft:
      case Direction.upRight:
        newAnimation = SpriteSheetPlayer.getAttackTopRight();
        break;
      case Direction.downLeft:
      case Direction.downRight:
        newAnimation = SpriteSheetPlayer.getAttackBottomRight();
        break;
    }
    animation?.playOnce(newAnimation, useCompFlip: true);
  }

  void _addDamageAnimation(VoidCallback onFinish) {
    Future<SpriteAnimation> newAnimation;
    switch (lastDirection) {
      case Direction.left:
      case Direction.right:
        newAnimation = SpriteSheetPlayer.getDamageBottomRight();
        break;
      case Direction.up:
        if (lastDirectionHorizontal == Direction.left) {
          newAnimation = SpriteSheetPlayer.getDamageTopLeft();
        } else {
          newAnimation = SpriteSheetPlayer.getDamageTopRight();
        }
        break;
      case Direction.down:
        if (lastDirectionHorizontal == Direction.left) {
          newAnimation = SpriteSheetPlayer.getDamageBottomLeft();
        } else {
          newAnimation = SpriteSheetPlayer.getDamageBottomRight();
        }
        break;
      case Direction.upLeft:
      case Direction.upRight:
        newAnimation = SpriteSheetPlayer.getDamageTopRight();
        break;
      case Direction.downLeft:
      case Direction.downRight:
        newAnimation = SpriteSheetPlayer.getDamageBottomRight();
        break;
    }
    animation?.playOnce(
      newAnimation,
      runToTheEnd: true,
      onFinish: onFinish,
      useCompFlip: true,
    );
  }

  void _attack() {
    _addAttackAnimation();
    this.simpleAttackMelee(
      damage: 10,
      size: Vector2.all(tileSize * 1.5),
      withPush: false,
    );
  }
}
