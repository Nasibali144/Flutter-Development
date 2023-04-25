import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:  DefaultTextStyle(
            style: const TextStyle(fontSize: 36, color: Colors.blue),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'DefaultText first',
                  ),
                  Text(
                    'DefaultText  two',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'DefaultText  three',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
