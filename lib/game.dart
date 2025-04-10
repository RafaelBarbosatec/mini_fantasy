import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minifantasy/components/human_player.dart';
import 'package:minifantasy/components/light.dart';
import 'package:minifantasy/components/orc.dart';
import 'package:minifantasy/main.dart';

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double maxSize = max(size.width, size.height);
    return LayoutBuilder(builder: (context, constraints) {
      return Material(
        color: Colors.transparent,
        child: BonfireWidget(
          playerControllers: [
            Joystick(
              directional: JoystickDirectional(),
              actions: [
                JoystickAction(
                  actionId: 1,
                  margin: const EdgeInsets.all(65),
                )
              ],
            ),
            Keyboard(
              config: KeyboardConfig(
                acceptedKeys: [
                  LogicalKeyboardKey.space,
                  LogicalKeyboardKey.select,
                ],
              ),
            )
          ],
          player: HumanPlayer(Vector2(4 * tileSize, 4 * tileSize)),
          cameraConfig: CameraConfig(zoom: maxSize / (tileSize * 20)),
          map: WorldMapByTiled(
            WorldMapReader.fromAsset('tile/map.json'),
            forceTileSize: Vector2.all(tileSize),
            objectsBuilder: {
              'light': (properties) => Light(
                    properties.position,
                    properties.size,
                  ),
              'orc': (properties) => Orc(properties.position),
            },
          ),
          lightingColorGame: Colors.black.withOpacity(0.7),
        ),
      );
    });
  }
}
