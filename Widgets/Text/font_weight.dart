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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text("FontWeight.w100", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w100)),
              Text("FontWeight.w200", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w200)),
              Text("FontWeight.w300", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300)),
              Text("FontWeight.w400", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
              Text("FontWeight.w500", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
              Text("FontWeight.w600", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
              Text("FontWeight.w700", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700)),
              Text("FontWeight.w800", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800)),
              Text("FontWeight.w900", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
              Text("FontWeight.normal", style: TextStyle(fontSize: 32, fontWeight: FontWeight.normal)),
              Text("FontWeight.bold", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
