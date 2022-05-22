import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  void changeText(String te) {
    setState(() {
      this.text = te;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HOME"),
        ),
        body: Column(children: <Widget>[
          HomePageWidget(this.changeText),
          Text(this.text)
        ]));
  }
}

class HomePageWidget extends StatefulWidget {
  final Function(String) callback;

  HomePageWidget(this.callback);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final controller = TextEditingController();

  void clickSendButton() {
    widget.callback(this.controller.text);
    this.controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: this.controller,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.chat_rounded),
              labelText: "type here",
              suffixIcon: IconButton(
                  icon: Icon(Icons.send_sharp), onPressed: clickSendButton)),
        ),
      ],
    );
  }
}
