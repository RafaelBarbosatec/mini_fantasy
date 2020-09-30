import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:minifantasy/main.dart';
import 'package:minifantasy/sprite_sheet_orc.dart';

class Orc extends SimpleEnemy {
  bool canMove = true;

  Orc(Position position)
      : super(
          initPosition: position,
          animation: SimpleDirectionAnimation(
            idleLeft: SpriteSheetOrc.getIdleBottomLeft(),
            idleRight: SpriteSheetOrc.getIdleBottomRight(),
            idleBottomRight: SpriteSheetOrc.getIdleBottomRight(),
            idleBottomLeft: SpriteSheetOrc.getIdleBottomLeft(),
            idleTopRight: SpriteSheetOrc.getIdleTopRight(),
            idleTopLeft: SpriteSheetOrc.getIdleTopLeft(),
            idleTop: SpriteSheetOrc.getIdleTopRight(),
            idleBottom: SpriteSheetOrc.getIdleBottomRight(),
            runLeft: SpriteSheetOrc.getRunBottomLeft(),
            runRight: SpriteSheetOrc.getRunBottomRight(),
            runTopLeft: SpriteSheetOrc.getRunTopLeft(),
            runTopRight: SpriteSheetOrc.getRunTopRight(),
          ),
          speed: tileSize * 3,
          width: tileSize * 2.9,
          height: tileSize * 2.9,
          collision: Collision(
            height: tileSize * 0.4,
            width: tileSize * 0.5,
            align: Offset(tileSize * 1.2, tileSize * 1.5),
          ),
        );

  @override
  void update(double dt) {
    if (canMove)
      this.seeAndMoveToPlayer(
        radiusVision: tileSize * 2,
        closePlayer: (player) {
          this.simpleAttackMelee(
              damage: 10,
              widthArea: tileSize * 1.5,
              heightArea: tileSize * 1.5,
              interval: 500,
              execute: () {
                _addAttackAnimation();
              });
        },
      );
    super.update(dt);
  }

  @override
  void die() {
    remove();
    gameRef.addGameComponent(
      AnimatedObjectOnce(
        animation: SpriteSheetOrc.getDie(),
        position: this.position,
      ),
    );
    super.die();
  }

  @override
  void receiveDamage(double damage, dynamic from) {
    this.showDamage(
      damage,
      config: TextConfig(
        fontSize: tileSize * 0.6,
        color: Colors.white,
      ),
      initVelocityTop: -2,
    );
    _addDamageAnimation();
    super.receiveDamage(damage, from);
  }

  void _addAttackAnimation() {
    FlameAnimation.Animation newAnimation;
    switch (lastDirection) {
      case Direction.left:
        newAnimation = SpriteSheetOrc.getAttackBottomLeft();
        break;
      case Direction.right:
        newAnimation = SpriteSheetOrc.getAttackBottomRight();
        break;
      case Direction.top:
        if (lastDirectionHorizontal == Direction.right) {
          newAnimation = SpriteSheetOrc.getAttackTopRight();
        } else {
          newAnimation = SpriteSheetOrc.getAttackTopLeft();
        }
        break;
      case Direction.bottom:
        if (lastDirectionHorizontal == Direction.right) {
          newAnimation = SpriteSheetOrc.getAttackBottomRight();
        } else {
          newAnimation = SpriteSheetOrc.getAttackBottomLeft();
        }
        break;
      case Direction.topLeft:
        newAnimation = SpriteSheetOrc.getAttackTopLeft();
        break;
      case Direction.topRight:
        newAnimation = SpriteSheetOrc.getAttackTopRight();
        break;
      case Direction.bottomLeft:
        newAnimation = SpriteSheetOrc.getAttackBottomLeft();
        break;
      case Direction.bottomRight:
        newAnimation = SpriteSheetOrc.getAttackBottomRight();
        break;
    }
    animation.playOnce(
      newAnimation,
      runToTheEnd: true,
    );
  }

  void _addDamageAnimation() {
    canMove = false;
    FlameAnimation.Animation newAnimation;
    switch (lastDirection) {
      case Direction.left:
        newAnimation = SpriteSheetOrc.getDamageBottomLeft();
        break;
      case Direction.right:
        newAnimation = SpriteSheetOrc.getDamageBottomRight();
        break;
      case Direction.top:
        if (lastDirectionHorizontal == Direction.right) {
          newAnimation = SpriteSheetOrc.getDamageTopRight();
        } else {
          newAnimation = SpriteSheetOrc.getDamageTopLeft();
        }
        break;
      case Direction.bottom:
        if (lastDirectionHorizontal == Direction.right) {
          newAnimation = SpriteSheetOrc.getDamageBottomRight();
        } else {
          newAnimation = SpriteSheetOrc.getDamageBottomLeft();
        }
        break;
      case Direction.topLeft:
        newAnimation = SpriteSheetOrc.getDamageTopLeft();
        break;
      case Direction.topRight:
        newAnimation = SpriteSheetOrc.getDamageTopRight();
        break;
      case Direction.bottomLeft:
        newAnimation = SpriteSheetOrc.getDamageBottomLeft();
        break;
      case Direction.bottomRight:
        newAnimation = SpriteSheetOrc.getDamageBottomRight();
        break;
    }
    animation.playOnce(newAnimation, onFinish: () {
      canMove = true;
    });
  }
}
