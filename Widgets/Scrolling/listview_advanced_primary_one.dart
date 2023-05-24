/// source: https://docs.flutter.dev/resources/platform-adaptations#return-to-top

import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: false,
      ),
      body: ListView(
        cacheExtent: 0,
        primary: false,
        children: const [
          MyBox(color: Colors.red),
          MyBox(color: Colors.blue),
          MyBox(color: Colors.greenAccent),
          MyBox(color: Colors.yellow),
          MyBox(color: Colors.indigo),
        ],
      ),
    );
  }
}

class MyBox extends StatelessWidget {
  final Color color;
  const MyBox({
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("MyBox: ${color.toString()}. Built!");
    return Container(height: 600, color: color);
  }
}
