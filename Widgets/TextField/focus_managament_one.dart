/// Snapshot 0ne

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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25, vertical: 100),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [

              /// #text1
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "CVC",
                  filled: true,
                ),
                textInputAction: TextInputAction.next,
                maxLength: 3,
              ),
              SizedBox(height: 20,),

              /// #text2
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Date"
                ),
                textInputAction: TextInputAction.next,
                maxLength: 5,
              ),
              SizedBox(height: 20,),

              /// #text3
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  filled: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
