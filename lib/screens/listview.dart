import 'package:flutter/material.dart';
import 'package:timtraining/models/post.dart';

class PostList extends StatefulWidget {
  List<Post> post_list;

  PostList(this.post_list);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void thumpPressed(pos) {
    setState(() {
      debugPrint("Thumb clicked");
      widget.post_list[pos].updateLikes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.widget.post_list.length,
        itemBuilder: (context, position) {
          Post post = this.widget.post_list[position];
          return Card(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(post.post_title),
                      subtitle: Text(post.author),
                    )),
                Row(
                  children: <Widget>[
                    Text(post.likes.toString()),
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      color: post.user_liked ? Colors.blue : Colors.black,
                      onPressed: () => thumpPressed(position),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}