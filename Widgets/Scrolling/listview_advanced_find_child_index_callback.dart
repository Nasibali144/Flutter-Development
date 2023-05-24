/// source: https://stackoverflow.com/questions/72448181/how-to-properly-use-the-findchildindexcallback-in-listview-builder-flutter
import 'dart:math';
import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final items = List<int>.generate(10, (int index) => index, growable: true);

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: StatefulBuilder(
        builder: (context, setState) {
          return Scaffold(
            body: Center(
              child: ListWidget(items: items),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                final nextItem = items.length;
                final nextIndex = random.nextInt(nextItem + 1);
                debugPrint('nextIndex = $nextIndex, nextItem = $nextItem');
                setState(() {
                  items.insert(nextIndex, nextItem);
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({Key? key, required this.items}) : super(key: key);

  final List<int> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = items[index];
        return ItemWidget(key: ValueKey(item), item: item);
      },
      itemCount: items.length,
      findChildIndexCallback: (Key key) {
        final valueKey = key as ValueKey;
        final index = items.indexWhere((item) => item == valueKey.value);
        if (index == -1) return null;
        return index;
      },
    );
  }
}

class ItemWidget extends StatefulWidget {
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  final int item;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget>
    with AutomaticKeepAliveClientMixin {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListTile(
      selected: selected,
      title: Text('Index-${widget.item}'),
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
