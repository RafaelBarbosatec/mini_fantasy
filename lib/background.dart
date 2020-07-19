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
    position = rectOrigin.translate(gameRef.gameCamera.position.x * -1.2, 0);
    super.update(t);
  }

  @override
  void resize(Size size) {
    position = rectOrigin = Rect.fromLTWH(0, 0, size.height * 3, size.height);
    super.resize(size);
  }

  @override
  void render(Canvas canvas) {
    img.renderRect(canvas, position);
    super.render(canvas);
  }
}
