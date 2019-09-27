import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mwinda_app/app_screens/posts/post.dart';


class PostDetail extends StatelessWidget {
  // Declare a field that holds the Post.
  final Post post;

  // In the constructor, require a Post.
  PostDetail({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(post.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    post.image,
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
      ),
    );

/*
  @override
  Widget build(BuildContext context) {
    // Use the Post to create the UI.
    return Scaffold(
      /*appBar: AppBar(
        title: Text(post.title),
      ),*/
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)
        {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Collapsing Toolbar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )
                  ),
                  background: Image.network(
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ];
        }
            /*Container(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(post.text),
              ),
            )*/

    ),
    );*/
  }
}