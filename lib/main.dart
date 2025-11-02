import 'package:flutter/material.dart';
import 'package:graphx/graphx.dart';
import 'package:simple_graphx/scene.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SceneBuilderWidget(
          autoSize: true,
          builder: () => SceneController(back: MyScene()),
        ),
      ),
    );
  }
}
