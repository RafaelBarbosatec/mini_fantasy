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
          animIdleLeft: SpriteSheetOrc.getIdleBottomLeft(),
          animIdleRight: SpriteSheetOrc.getIdleBottomRight(),
          animIdleBottomRight: SpriteSheetOrc.getIdleBottomRight(),
          animIdleBottomLeft: SpriteSheetOrc.getIdleBottomLeft(),
          animIdleTopRight: SpriteSheetOrc.getIdleTopRight(),
          animIdleTopLeft: SpriteSheetOrc.getIdleTopLeft(),
          animIdleTop: SpriteSheetOrc.getIdleTopRight(),
          animIdleBottom: SpriteSheetOrc.getIdleBottomRight(),
          animRunLeft: SpriteSheetOrc.getRunBottomLeft(),
          animRunRight: SpriteSheetOrc.getRunBottomRight(),
          animRunTopLeft: SpriteSheetOrc.getRunTopLeft(),
          animRunTopRight: SpriteSheetOrc.getRunTopRight(),
          speed: 50,
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
  void receiveDamage(double damage, int from) {
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
    FlameAnimation.Animation animation;
    switch (lastDirection) {
      case Direction.left:
        animation = SpriteSheetOrc.getAttackBottomLeft();
        break;
      case Direction.right:
        animation = SpriteSheetOrc.getAttackBottomRight();
        break;
      case Direction.top:
        if (lastDirectionHorizontal == Direction.right) {
          animation = SpriteSheetOrc.getAttackTopRight();
        } else {
          animation = SpriteSheetOrc.getAttackTopLeft();
        }
        break;
      case Direction.bottom:
        if (lastDirectionHorizontal == Direction.right) {
          animation = SpriteSheetOrc.getAttackBottomRight();
        } else {
          animation = SpriteSheetOrc.getAttackBottomLeft();
        }
        break;
      case Direction.topLeft:
        animation = SpriteSheetOrc.getAttackTopLeft();
        break;
      case Direction.topRight:
        animation = SpriteSheetOrc.getAttackTopRight();
        break;
      case Direction.bottomLeft:
        animation = SpriteSheetOrc.getAttackBottomLeft();
        break;
      case Direction.bottomRight:
        animation = SpriteSheetOrc.getAttackBottomRight();
        break;
    }
    addFastAnimation(
      animation,
    );
  }

  void _addDamageAnimation() {
    canMove = false;
    FlameAnimation.Animation animation;
    switch (lastDirection) {
      case Direction.left:
        animation = SpriteSheetOrc.getDamageBottomLeft();
        break;
      case Direction.right:
        animation = SpriteSheetOrc.getDamageBottomRight();
        break;
      case Direction.top:
        if (lastDirectionHorizontal == Direction.right) {
          animation = SpriteSheetOrc.getDamageTopRight();
        } else {
          animation = SpriteSheetOrc.getDamageTopLeft();
        }
        break;
      case Direction.bottom:
        if (lastDirectionHorizontal == Direction.right) {
          animation = SpriteSheetOrc.getDamageBottomRight();
        } else {
          animation = SpriteSheetOrc.getDamageBottomLeft();
        }
        break;
      case Direction.topLeft:
        animation = SpriteSheetOrc.getDamageTopLeft();
        break;
      case Direction.topRight:
        animation = SpriteSheetOrc.getDamageTopRight();
        break;
      case Direction.bottomLeft:
        animation = SpriteSheetOrc.getDamageBottomLeft();
        break;
      case Direction.bottomRight:
        animation = SpriteSheetOrc.getDamageBottomRight();
        break;
    }
    addFastAnimation(animation, onFinish: () {
      canMove = true;
    });
  }
}
