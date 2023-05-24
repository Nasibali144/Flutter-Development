/// source: 
/// https://mechurak.github.io/2022-10-26_listview-inside-singlechildscrollview/
/// https://www.fuwamaki.com/article/379
/// https://www.youtube.com/watch?v=33_0ABjFJUU

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView inside SingleChildScrollView'),
        ),
        body: SingleChildScrollView(  // <==== 주인공. Column 하나를 child로 가짐
          child: Column(  // 물론 Row도 가능
            children: [
              Container(
                height: 150,
                color: Colors.red,
                child: const Center(
                  child: Text("Some Widgets"),
                ),
              ),
              ListView.builder(  // <=== 성능을 생각한다면 ListView.builder 로 사용
                shrinkWrap: true, // <==== limit height. 리스트뷰 크기 고정
                primary: false, // <====  disable scrolling. 리스트뷰 내부는 스크롤 안할거임
                itemCount: 10,
                itemBuilder: (context, index) => ListTile(
                  title: Text("Item ${index + 1}"),
                ),
              ),
              Container(
                height: 150,
                color: Colors.green,
                child: const Center(
                  child: Text("Some Widgets"),
                ),
              ),
              Container(
                height: 150,
                color: Colors.blue,
                child: const Center(
                  child: Text("Some Widgets"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
