import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class Light extends GameDecoration with Lighting {
  Light(
    Vector2 position,
    double width,
    double height,
  ) : super(
          position: position,
          width: width,
          height: height,
        ) {
    setupLighting(
      LightingConfig(
        radius: width * 2,
        blurBorder: width * 1.5,
        color: Colors.orange.withOpacity(0.2),
        withPulse: true,
      ),
    );
  }
}
