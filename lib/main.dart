import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minifantasy/game.dart';
import 'package:minifantasy/sprite_sheet/sprite_sheet_orc.dart';
import 'package:minifantasy/sprite_sheet/sprite_sheet_player.dart';

double tileSize = 20.0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();
  }
  await SpriteSheetPlayer.load();
  await SpriteSheetOrc.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Fantasy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Game(),
    );
  }
}
