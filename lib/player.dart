import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:minifantasy/main.dart';
import 'package:minifantasy/sprite_sheet_player.dart';

class HumanPlayer extends SimplePlayer with Lighting {
  static double maxSpeed = tileSize * 4;

  bool lockMove = false;

  HumanPlayer(Position position)
      : super(
          initPosition: position,
          animation: SimpleDirectionAnimation(
            idleLeft: SpriteSheetPlayer.idleBottomLeft,
            idleRight: SpriteSheetPlayer.idleBottomRight,
            idleTop: SpriteSheetPlayer.idleTopRight,
            idleTopLeft: SpriteSheetPlayer.idleTopLeft,
            idleTopRight: SpriteSheetPlayer.idleTopRight,
            runLeft: SpriteSheetPlayer.runBottomLeft,
            runRight: SpriteSheetPlayer.runBottomRight,
            runTopLeft: SpriteSheetPlayer.runTopLeft,
            runTopRight: SpriteSheetPlayer.runTopRight,
            runBottomLeft: SpriteSheetPlayer.runBottomLeft,
            runBottomRight: SpriteSheetPlayer.runBottomRight,
          ),
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
      radius: width,
      blurBorder: width,
    );
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (isDead || lockMove) return;
    if ((event.id == 1 && event.event == ActionEvent.DOWN) ||
        (event.id == LogicalKeyboardKey.space.keyId ||
            event.id == LogicalKeyboardKey.select.keyId)) {
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
  void receiveDamage(double damage, dynamic from) {
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
    FlameAnimation.Animation newAnimation;
    switch (lastDirection) {
      case Direction.left:
        newAnimation = SpriteSheetPlayer.getAttackBottomLeft();
        break;
      case Direction.right:
        newAnimation = SpriteSheetPlayer.getAttackBottomRight();
        break;
      case Direction.top:
        newAnimation = SpriteSheetPlayer.getAttackTopRight();
        break;
      case Direction.bottom:
        newAnimation = SpriteSheetPlayer.getAttackBottomRight();
        break;
      case Direction.topLeft:
        newAnimation = SpriteSheetPlayer.getAttackTopLeft();
        break;
      case Direction.topRight:
        newAnimation = SpriteSheetPlayer.getAttackTopRight();
        break;
      case Direction.bottomLeft:
        newAnimation = SpriteSheetPlayer.getAttackBottomLeft();
        break;
      case Direction.bottomRight:
        newAnimation = SpriteSheetPlayer.getAttackBottomRight();
        break;
    }
    animation.playOnce(newAnimation);
  }

  void _addDamageAnimation(VoidCallback onFinish) {
    FlameAnimation.Animation newAnimation;
    switch (lastDirection) {
      case Direction.left:
        newAnimation = SpriteSheetPlayer.getDamageBottomLeft();
        break;
      case Direction.right:
        newAnimation = SpriteSheetPlayer.getDamageBottomRight();
        break;
      case Direction.top:
        newAnimation = SpriteSheetPlayer.getDamageTopRight();
        break;
      case Direction.bottom:
        newAnimation = SpriteSheetPlayer.getDamageBottomRight();
        break;
      case Direction.topLeft:
        newAnimation = SpriteSheetPlayer.getDamageTopLeft();
        break;
      case Direction.topRight:
        newAnimation = SpriteSheetPlayer.getDamageTopRight();
        break;
      case Direction.bottomLeft:
        newAnimation = SpriteSheetPlayer.getDamageBottomLeft();
        break;
      case Direction.bottomRight:
        newAnimation = SpriteSheetPlayer.getDamageBottomRight();
        break;
    }
    animation.playOnce(newAnimation,onFinish: onFinish);
  }
}
