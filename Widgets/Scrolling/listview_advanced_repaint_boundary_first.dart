/// source:
/// https://www.woolha.com/tutorials/flutter-using-repaintboundary-examples
/// https://api.flutter.dev/flutter/widgets/SliverChildBuilderDelegate/addRepaintBoundaries.html
/// https://api.flutter.dev/flutter/widgets/RepaintBoundary-class.html

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

void main() {
  debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Tutorial',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey _paintKey = GlobalKey();
  Offset _offset = Offset.zero;

  Widget _buildBackground() {
    return RepaintBoundary(
      child: CustomPaint(
        painter: MyExpensiveBackground(MediaQuery.of(context).size),
        isComplex: true,
        willChange: false,
      ),
    );
  }

  Widget _buildCursor() {
    return Listener(
      onPointerDown: _updateOffset,
      onPointerMove: _updateOffset,
      child: CustomPaint(
        key: _paintKey,
        painter: MyPointer(_offset),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Tutorial'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _buildBackground(),
          _buildCursor(),
        ],
      ),
    );
  }

  _updateOffset(PointerEvent event) {
    RenderBox? referenceBox = _paintKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = referenceBox.globalToLocal(event.position);
    setState(() {
      _offset = offset;
    });
  }
}

class MyExpensiveBackground extends CustomPainter {

  static const List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.purple,
    Colors.orange,
  ];

  final Size _size;

  MyExpensiveBackground(this._size);

  @override
  void paint(Canvas canvas, Size size) {
    debugPrint('Running extensive painting');
    final Random rand = Random(12345);

    for (int i = 0; i < 10000; i++) {
      canvas.drawOval(
          Rect.fromCenter(
            center: Offset(
              rand.nextDouble() * _size.width - 100,
              rand.nextDouble() * _size.height,
            ),
            width: rand.nextDouble() * rand.nextInt(150) + 200,
            height: rand.nextDouble() * rand.nextInt(150) + 200,
          ),
          Paint()
            ..color = colors[rand.nextInt(colors.length)].withOpacity(0.3)
      );
    }
  }

  @override
  bool shouldRepaint(MyExpensiveBackground other) => false;
}

class MyPointer extends CustomPainter {

  final Offset _offset;

  MyPointer(this._offset);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      _offset,
      10.0,
      Paint()..color = Colors.black,
    );
  }

  @override
  bool shouldRepaint(MyPointer oldDelegate) => oldDelegate._offset != _offset;
}
