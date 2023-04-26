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
    return  const Scaffold(
      body: SafeArea(
        child: Center(
          child: SelectionArea(
            child: MyRich(),
          ),
        ),
      ),
    );
  }
}

class MyRich extends StatelessWidget {
  const MyRich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      selectionRegistrar: SelectionContainer.maybeOf(context),
      selectionColor: const Color(0xAF6694e8),
      text: const TextSpan(
        style: TextStyle(
            fontSize: 25,
            color: Colors.black
        ),
        text: "hello flutter",
        /*children: [
                  TextSpan(
                    text: "Hello ",
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                    mouseCursor: MaterialStateMouseCursor.textable,
                    onEnter: (value) {
                      debugPrint("Hello onEnter: $value");
                    },
                    onExit: (value) {
                      debugPrint("Hello onExit: $value");
                    }
                  ),
                  const TextSpan(
                    text: "Flutter ",
                  ),
                  const TextSpan(
                    text: "Students ",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ]*/
      ),
    );
  }
}
