import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minifantasy/main.dart';
import 'package:minifantasy/sprite_sheet_player.dart';

class HumanPlayer extends SimplePlayer with Lighting {
  static double maxSpeed = tileSize * 4;

  bool lockMove = false;

  HumanPlayer(Position position)
      : super(
          initPosition: position,
          animIdleLeft: SpriteSheetPlayer.idleBottomLeft,
          animIdleRight: SpriteSheetPlayer.idleBottomRight,
          animIdleTop: SpriteSheetPlayer.idleTopRight,
          animIdleTopLeft: SpriteSheetPlayer.idleTopLeft,
          animIdleTopRight: SpriteSheetPlayer.idleTopRight,
          animRunLeft: SpriteSheetPlayer.runBottomLeft,
          animRunRight: SpriteSheetPlayer.runBottomRight,
          animRunTopLeft: SpriteSheetPlayer.runTopLeft,
          animRunTopRight: SpriteSheetPlayer.runTopRight,
          speed: maxSpeed,
          width: tileSize * 2.9,
          height: tileSize * 2.9,
          collision: Collision(
            height: tileSize * 0.4,
            width: tileSize * 0.5,
            align: Offset(tileSize * 1.2, tileSize * 1.5),
          ),
        ) {
    lightingConfig = LightingConfig(
      gameComponent: this,
      radius: width,
      blurBorder: width,
    );
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (isDead || lockMove) return;
    if (event.id == 1 && event.event == ActionEvent.DOWN) {
      _addAttackAnimation();
      this.simpleAttackMelee(
        damage: 10,
        widthArea: tileSize * 1.5,
        heightArea: tileSize * 1.5,
        withPush: false,
      );
    }
    super.joystickAction(event);
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (lockMove) return;
    speed = maxSpeed * event.intensity;
    super.joystickChangeDirectional(event);
  }

  @override
  void receiveDamage(double damage, int from) {
    this.showDamage(
      damage,
      config: TextConfig(fontSize: tileSize * 0.6, color: Colors.red),
      initVelocityTop: -2,
    );
    lockMove = true;
    _addDamageAnimation(() {
      lockMove = false;
    });
    super.receiveDamage(damage, from);
  }

  @override
  void die() {
    remove();
    gameRef.addGameComponent(
      AnimatedObjectOnce(
        animation: SpriteSheetPlayer.getDie(),
        position: this.position,
      ),
    );
    super.die();
  }

  void _addAttackAnimation() {
    FlameAnimation.Animation animation;
    switch (lastDirection) {
      case Direction.left:
        animation = SpriteSheetPlayer.getAttackBottomLeft();
        break;
      case Direction.right:
        animation = SpriteSheetPlayer.getAttackBottomRight();
        break;
      case Direction.top:
        animation = SpriteSheetPlayer.getAttackTopRight();
        break;
      case Direction.bottom:
        animation = SpriteSheetPlayer.getAttackBottomRight();
        break;
      case Direction.topLeft:
        animation = SpriteSheetPlayer.getAttackTopLeft();
        break;
      case Direction.topRight:
        animation = SpriteSheetPlayer.getAttackTopRight();
        break;
      case Direction.bottomLeft:
        animation = SpriteSheetPlayer.getAttackBottomLeft();
        break;
      case Direction.bottomRight:
        animation = SpriteSheetPlayer.getAttackBottomRight();
        break;
    }
    addFastAnimation(
      animation,
    );
  }

  void _addDamageAnimation(VoidCallback onFinish) {
    FlameAnimation.Animation animation;
    switch (lastDirection) {
      case Direction.left:
        animation = SpriteSheetPlayer.getDamageBottomLeft();
        break;
      case Direction.right:
        animation = SpriteSheetPlayer.getDamageBottomRight();
        break;
      case Direction.top:
        animation = SpriteSheetPlayer.getDamageTopRight();
        break;
      case Direction.bottom:
        animation = SpriteSheetPlayer.getDamageBottomRight();
        break;
      case Direction.topLeft:
        animation = SpriteSheetPlayer.getDamageTopLeft();
        break;
      case Direction.topRight:
        animation = SpriteSheetPlayer.getDamageTopRight();
        break;
      case Direction.bottomLeft:
        animation = SpriteSheetPlayer.getDamageBottomLeft();
        break;
      case Direction.bottomRight:
        animation = SpriteSheetPlayer.getDamageBottomRight();
        break;
    }
    addFastAnimation(
      animation,
      onFinish: onFinish,
    );
  }
}
