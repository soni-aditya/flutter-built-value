import 'package:flutter/material.dart';

import 'models/reddit.dart';
import 'service/api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  List _posts = [];

  @override
  void initState() {
    super.initState();
    refershPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Some Title'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          refershPosts();
        },
        child: AnimatedCrossFade(
          duration: Duration(microseconds: 300),
          firstChild: Center(
            child: CircularProgressIndicator(),
          ),
          secondChild: ListView(
            children: buildListTile(),
          ),
          crossFadeState: (_posts == null)
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        ),
      ),
    );
  }

  refershPosts() {
    getReddit().then((redditPosts) {
      setState(() {
        _posts = redditPosts;
      });
    });
  }

  List<Widget> buildListTile() {
    return _posts
        .map((post) => ListTile(
              leading: CircleAvatar(
                child: Image.network(
                  '${!post.thumbnail.contains(".jpg") ? "http://via.placeholder.com/300" : post.thumbnail}',
                  scale: 0.2,
                ),
              ),
              title: Text(
                  'Subreddit : ${post.subreddit} with ${post.ups} upvotes'),
            ))
        .toList();
  }
}
