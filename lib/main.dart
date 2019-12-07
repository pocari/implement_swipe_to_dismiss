import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: Text("implement swipe to dismiss")),
        body: MyPage(),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1} hoge");
  @override
  Widget build(BuildContext context) => Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => Dismissible(
            key: Key(items[index]),
            onDismissed: (direction) {
              final item = items[index];
              print('direction: $direction');
              setState(() {
                items.removeAt(index);
              });
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(milliseconds: 600),
                  content: Text('$item dismissed'),
                ),
              );
            },
            child: ListTile(
              title: Text('${items[index]}'),
            ),
          ),
        ),
      );
}
