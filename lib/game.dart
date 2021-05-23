import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:minifantasy/background.dart';
import 'package:minifantasy/light.dart';
import 'package:minifantasy/main.dart';
import 'package:minifantasy/orc.dart';
import 'package:minifantasy/player.dart';

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      tileSize = max(constraints.maxHeight, constraints.maxWidth) / 40;
      return Material(
        color: Colors.transparent,
        child: BonfireTiledWidget(
          joystick: Joystick(
            keyboardEnable: true,
            directional: JoystickDirectional(),
            actions: [
              JoystickAction(
                actionId: 1,
                margin: const EdgeInsets.all(65),
              )
            ],
          ),
          player: HumanPlayer(Vector2(4 * tileSize, 4 * tileSize)),
          map: TiledWorldMap(
            'tile/map.json',
            forceTileSize: Size(tileSize, tileSize),
          )
            ..registerObject(
              'light',
              (x, y, width, height) => Light(Vector2(x, y), width, height),
            )
            ..registerObject(
                'orc', (x, y, width, height) => Orc(Vector2(x, y))),
          lightingColorGame: Colors.black.withOpacity(0.8),
          progress: Center(
            child: Text(
              'Loading...',
              style: TextStyle(color: Colors.white),
            ),
          ),
          background: Background(),
        ),
      );
    });
  }
}
