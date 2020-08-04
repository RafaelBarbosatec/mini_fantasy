import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class Light extends GameDecoration with Lighting {
  Light(
    Position position,
    double width,
    double height,
  ) : super(
          initPosition: position,
          width: width,
          height: height,
        ) {
    lightingConfig = LightingConfig(
      gameComponent: this,
      radius: width * 2,
      blurBorder: width * 1.5,
      color: Colors.orange.withOpacity(0.2),
      withPulse: true,
    );
  }
}
