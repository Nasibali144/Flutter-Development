import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("リスト"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: const TextField(
                  decoration: InputDecoration(hintText: "Input"),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 30,
                itemBuilder: (context, index) => ListTile(
                  title: Text("item ${index + 1}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
