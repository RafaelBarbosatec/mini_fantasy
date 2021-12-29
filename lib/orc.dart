import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:minifantasy/main.dart';
import 'package:minifantasy/sprite_sheet_orc.dart';

class Orc extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement {
  bool canMove = true;

  Orc(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleLeft: SpriteSheetOrc.getIdleBottomLeft(),
            idleRight: SpriteSheetOrc.getIdleBottomRight(),
            idleDownRight: SpriteSheetOrc.getIdleBottomRight(),
            idleDownLeft: SpriteSheetOrc.getIdleBottomLeft(),
            idleUpRight: SpriteSheetOrc.getIdleTopRight(),
            idleUpLeft: SpriteSheetOrc.getIdleTopLeft(),
            idleUp: SpriteSheetOrc.getIdleTopRight(),
            idleDown: SpriteSheetOrc.getIdleBottomRight(),
            runLeft: SpriteSheetOrc.getRunBottomLeft(),
            runRight: SpriteSheetOrc.getRunBottomRight(),
            runUpLeft: SpriteSheetOrc.getRunTopLeft(),
            runUpRight: SpriteSheetOrc.getRunTopRight(),
          ),
          speed: tileSize * 3,
          size: Vector2.all(tileSize * 2.9),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              tileSize * 0.4,
              tileSize * 0.5,
            ),
            align: Vector2(tileSize * 1.2, tileSize * 1.5),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    if (canMove) {
      this.seePlayer(
        radiusVision: tileSize * 2,
        observed: (player) {
          this.followComponent(
            player,
            dt,
            closeComponent: (comp) {
              _execAttack();
            },
          );
        },
        notObserved: () {
          this.runRandomMovement(
            dt,
            speed: speed / 3,
            maxDistance: (tileSize * 2).toInt(),
          );
        },
      );
    }
    super.update(dt);
  }

  @override
  void die() {
    canMove = false;
    animation.playOnce(
      SpriteSheetOrc.getDie(),
      onFinish: () {
        removeFromParent();
      },
    );
    super.die();
  }

  @override
  void receiveDamage(double damage, dynamic from) {
    this.showDamage(
      damage,
      initVelocityTop: -2,
    );
    _addDamageAnimation();
    super.receiveDamage(damage, from);
  }

  void _addAttackAnimation() {
    Future<SpriteAnimation> newAnimation;
    switch (lastDirection) {
      case Direction.left:
        newAnimation = SpriteSheetOrc.getAttackBottomLeft();
        break;
      case Direction.right:
        newAnimation = SpriteSheetOrc.getAttackBottomRight();
        break;
      case Direction.up:
        if (lastDirectionHorizontal == Direction.right) {
          newAnimation = SpriteSheetOrc.getAttackTopRight();
        } else {
          newAnimation = SpriteSheetOrc.getAttackTopLeft();
        }
        break;
      case Direction.down:
        if (lastDirectionHorizontal == Direction.right) {
          newAnimation = SpriteSheetOrc.getAttackBottomRight();
        } else {
          newAnimation = SpriteSheetOrc.getAttackBottomLeft();
        }
        break;
      case Direction.upLeft:
        newAnimation = SpriteSheetOrc.getAttackTopLeft();
        break;
      case Direction.upRight:
        newAnimation = SpriteSheetOrc.getAttackTopRight();
        break;
      case Direction.downLeft:
        newAnimation = SpriteSheetOrc.getAttackBottomLeft();
        break;
      case Direction.downRight:
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
    Future<SpriteAnimation> newAnimation;
    switch (lastDirection) {
      case Direction.left:
        newAnimation = SpriteSheetOrc.getDamageBottomLeft();
        break;
      case Direction.right:
        newAnimation = SpriteSheetOrc.getDamageBottomRight();
        break;
      case Direction.up:
        if (lastDirectionHorizontal == Direction.right) {
          newAnimation = SpriteSheetOrc.getDamageTopRight();
        } else {
          newAnimation = SpriteSheetOrc.getDamageTopLeft();
        }
        break;
      case Direction.down:
        if (lastDirectionHorizontal == Direction.right) {
          newAnimation = SpriteSheetOrc.getDamageBottomRight();
        } else {
          newAnimation = SpriteSheetOrc.getDamageBottomLeft();
        }
        break;
      case Direction.upLeft:
        newAnimation = SpriteSheetOrc.getDamageTopLeft();
        break;
      case Direction.upRight:
        newAnimation = SpriteSheetOrc.getDamageTopRight();
        break;
      case Direction.downLeft:
        newAnimation = SpriteSheetOrc.getDamageBottomLeft();
        break;
      case Direction.downRight:
        newAnimation = SpriteSheetOrc.getDamageBottomRight();
        break;
    }
    animation.playOnce(
      newAnimation,
      runToTheEnd: true,
      onFinish: () {
        canMove = true;
      },
    );
  }

  @override
  void render(Canvas canvas) {
    if (!isDead) {
      this.drawDefaultLifeBar(
        canvas,
        drawInBottom: true,
        margin: 0,
        width: tileSize * 1.5,
        borderWidth: tileSize / 5,
        height: tileSize / 5,
        borderColor: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(2),
        align: Offset(
          tileSize * 0.7,
          tileSize * 0.7,
        ),
      );
    }
    super.render(canvas);
  }

  void _execAttack() {
    this.simpleAttackMelee(
      damage: 10,
      size: Vector2.all(tileSize * 1.5),
      interval: 800,
      execute: () {
        _addAttackAnimation();
      },
    );
  }
}
