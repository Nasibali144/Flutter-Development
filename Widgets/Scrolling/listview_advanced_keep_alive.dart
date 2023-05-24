/// source: 
/// https://gist.github.com/CaiJingLong/205482e9ae3556e0b833681bde1e7d2a
/// https://api.flutter.dev/flutter/widgets/SliverChildBuilderDelegate/addAutomaticKeepAlives.html
/// https://api.flutter.dev/flutter/widgets/AutomaticKeepAlive-class.html

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: controller,
            tabs: const <Widget>[
              Tab(text: "1"),
              Tab(text: "2"),
              Tab(text: "3"),
              Tab(text: "4"),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: const <Widget>[
            SubPage(),
            SubPage(),
            SubPage(),
            SubPage(),
          ],
        ),
      ),
    );
  }
}

class SubPage extends StatefulWidget {
  const SubPage({super.key});

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const ListViewWidget();
  }

  @override
  bool get wantKeepAlive => true;
}

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: 50,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return ListTile(
      title: Text(index.toString()),
    );
  }
}
