import 'package:flutter/material.dart';
import 'package:timtraining/models/post.dart';

import 'listview.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> postList = [];

  void changeText(String te) {
    setState(() {
      this.postList.add(Post(te, "Mithun"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HOME"),
        ),
        body: Column(children: <Widget>[
          Expanded(child: PostList(this.postList)),
          Container(
            child: HomePageWidget(this.changeText),
            padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
          )
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
          style: TextStyle(color: Colors.blue, fontSize: 20),
          controller: this.controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.yellow, width: 4)),
              //focusedErrorBorder:OutlineInputBorder(borderSide: const BorderSide(color: Colors.yellow,width: 4)),
              prefixIcon: Icon(Icons.chat_rounded),
              labelText: "type here",
              suffixIcon: IconButton(
                  icon: Icon(Icons.send_sharp), onPressed: clickSendButton)),
        ),
      ],
    );
  }
}


