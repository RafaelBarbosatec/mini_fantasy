import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';

class Background extends GameBackground {
  Sprite img;
  Vector2Rect rectOrigin;

  @override
  bool get isHud => true;

  @override
  Future<void> onLoad() async {
    img = await Sprite.load('bg.jpeg');
    return super.onLoad();
  }

  @override
  void update(double t) {
    super.update(t);
  }

  @override
  void onGameResize(Vector2 size) {
    position = rectOrigin = Rect.fromLTWH(
      0,
      0,
      size.y * 3,
      size.x,
    ).toVector2Rect();
    super.onGameResize(size);
  }

  @override
  void render(Canvas canvas) {
    position = rectOrigin.translate(
      gameRef.camera.position.dx * -0.8,
      0,
    );
    img.renderFromVector2Rect(canvas, position);
    super.render(canvas);
  }

  @override
  int get priority => LayerPriority.BACKGROUND;
}
