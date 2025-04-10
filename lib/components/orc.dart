import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:minifantasy/main.dart';
import 'package:minifantasy/sprite_sheet/sprite_sheet_orc.dart';

class Orc extends SimpleEnemy
    with BlockMovementCollision, RandomMovement, UseLifeBar {
  bool canMove1 = true;

  Orc(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteSheetOrc.getIdleBottomRight(),
            idleDownRight: SpriteSheetOrc.getIdleBottomRight(),
            idleUpRight: SpriteSheetOrc.getIdleTopRight(),
            idleUp: SpriteSheetOrc.getIdleTopRight(),
            idleDown: SpriteSheetOrc.getIdleBottomRight(),
            runRight: SpriteSheetOrc.getRunBottomRight(),
            runUpRight: SpriteSheetOrc.getRunTopRight(),
          ),
          speed: tileSize * 3,
          size: Vector2.all(tileSize * 2.9),
        ) {
    setupLifeBar(
      size: Vector2(tileSize * 1.5, tileSize / 5),
      borderWidth: tileSize / 5,
      borderColor: Colors.white.withOpacity(0.5),
      borderRadius: BorderRadius.circular(2),
      barLifeDrawPosition: BarLifeDrawPosition.bottom,
      showLifeText: false,
      offset: Vector2(0, -tileSize * 0.4),
    );
  }

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2(size.x * 0.2, size.y * 0.15),
        position: Vector2(tileSize * 1.15, tileSize * 1.5),
      ),
    );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (canMove1) {
      this.seePlayer(
        radiusVision: tileSize * 2,
        observed: (player) {
          this.moveTowardsTarget(
            target: player,
            close: _execAttack,
          );
        },
        notObserved: () {
          this.runRandomMovement(
            dt,
            speed: speed / 3,
            maxDistance: (tileSize * 2),
          );
        },
      );
    }
    super.update(dt);
  }

  @override
  void onDie() {
    canMove1 = false;
    animation?.playOnce(
      SpriteSheetOrc.getDie(),
      onFinish: () {
        removeFromParent();
      },
      runToTheEnd: true,
      useCompFlip: true,
    );
    super.onDie();
  }

  @override
  void onReceiveDamage(AttackOriginEnum attacker, double damage, identify) {
    if (!isDead) {
      this.showDamage(
        damage,
        initVelocityVertical: -2,
        config: TextStyle(color: Colors.white, fontSize: tileSize / 2),
      );
      _addDamageAnimation();
    }
    super.onReceiveDamage(attacker, damage, identify);
  }

  void _addAttackAnimation() {
    Future<SpriteAnimation> newAnimation;
    switch (lastDirection) {
      case Direction.left:
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
      case Direction.upRight:
        newAnimation = SpriteSheetOrc.getAttackTopRight();
        break;
      case Direction.downLeft:
      case Direction.downRight:
        newAnimation = SpriteSheetOrc.getAttackBottomRight();
        break;
    }
    animation?.playOnce(
      newAnimation,
      runToTheEnd: true,
      useCompFlip: true,
    );
  }

  void _addDamageAnimation() {
    canMove1 = false;
    Future<SpriteAnimation> newAnimation;
    switch (lastDirection) {
      case Direction.left:
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
      case Direction.upRight:
        newAnimation = SpriteSheetOrc.getDamageTopRight();
        break;
      case Direction.downLeft:
      case Direction.downRight:
        newAnimation = SpriteSheetOrc.getDamageBottomRight();
        break;
    }
    animation?.playOnce(
      newAnimation,
      runToTheEnd: true,
      useCompFlip: true,
      onFinish: () {
        canMove1 = true;
      },
    );
  }

  void _execAttack() {
    this.simpleAttackMelee(
      damage: 10,
      size: Vector2.all(tileSize * 1.5),
      interval: 800,
      execute: _addAttackAnimation,
    );
  }
}
