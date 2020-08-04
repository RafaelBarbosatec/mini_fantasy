import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';

class Background extends GameComponent {
  Sprite img;
  Rect rectOrigin;

  Background() {
    img = Sprite('bg.jpeg');
  }

  bool isHud() => true;

  @override
  void update(double t) {
    super.update(t);
  }

  @override
  void resize(Size size) {
    position = rectOrigin = Rect.fromLTWH(0, 0, size.height * 3, size.height);
    super.resize(size);
  }

  @override
  void render(Canvas canvas) {
    position = rectOrigin.translate(gameRef.gameCamera.position.x * -0.8, 0);
    img.renderRect(canvas, position);
    super.render(canvas);
  }
}
