/// Snapshot two
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final FocusNode textFocusOne = FocusNode();
  final FocusNode textFocusTwo= FocusNode();
  final FocusNode textFocusThree= FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25, vertical: 100),
        child: Align(
          alignment: const Alignment(0, 0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              /// #text1
              TextField(
                focusNode: textFocusOne,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: "CVC",
                  filled: true,
                ),
                textInputAction: TextInputAction.next,
                maxLength: 3,
                onChanged: (text) {
                  if(text.length >= 3) {
                    FocusScope.of(context).requestFocus(textFocusTwo);
                  }
                },
              ),
              const SizedBox(height: 20,),

              /// #text2
              TextField(
                focusNode: textFocusTwo,
                autofocus: true,
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Date"
                ),
                textInputAction: TextInputAction.next,
                maxLength: 5,
                onChanged: (text) {
                  if(text.length >= 5) {
                    FocusScope.of(context).requestFocus(textFocusThree);
                  }
                },
              ),
              SizedBox(height: 20,),

              /// #text3
              TextField(
                focusNode: textFocusThree,
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
