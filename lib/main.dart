import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  await Flame.util.setLandscape();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dino Warrior',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Dino Warrior'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BaseGame game;

  @override
  void initState() {
    super.initState();
    game = BaseGame();
    var dinoSprite = SpriteComponent.square(64, 'DinoSprites_tard.gif');
    dinoSprite.x = 100;
    dinoSprite.y = 100;
    game.add(dinoSprite);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: game.widget,
    );
  }
}
