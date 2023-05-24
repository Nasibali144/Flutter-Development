/// source:
/// https://www.woolha.com/tutorials/flutter-using-repaintboundary-examples
/// https://api.flutter.dev/flutter/widgets/SliverChildBuilderDelegate/addRepaintBoundaries.html
/// https://api.flutter.dev/flutter/widgets/RepaintBoundary-class.html

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintLayerBordersEnabled = true;
  debugRepaintRainbowEnabled = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Tutorial',
      home: RepaintBoundaryExample(),
    );
  }
}

class RepaintBoundaryExample extends StatefulWidget {
  const RepaintBoundaryExample({super.key});

  @override
  State createState() => _RepaintBoundaryExampleState();
}

class _RepaintBoundaryExampleState extends State<RepaintBoundaryExample> {

  double _size = 50;

  Widget _buildListView() {
    return Expanded(
      child: ListView.builder(
        addRepaintBoundaries: true,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 50,
              color: Colors.teal,
              child: const Center(
                child: Text('Flutter'),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimationBox() {
    return Container(
      color: Colors.pink,
      width: 200,
      height: 200,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 5),
            width: _size,
            height: _size,
            color: Colors.teal,
          ),
          OutlinedButton(
            child: const Text('Animate box'),
            onPressed: () {
              setState(() {
                _size = _size == 50 ? 150 : 50;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Tutorial'),
      ),
      body: Column(
        children: [
          _buildAnimationBox(),
          _buildListView(),
        ],
      ),
    );
  }
}
