import 'package:flutter/material.dart';
import 'package:mwinda_app/app_screens/posts/posts_list.dart';

import 'directory/provinces_list.dart';

class AppIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buidPostsGestureDetector(context),
                buidDirectoryGestureDetector(context)
              ],
            ),
          ),
      ),
    );

  }

  double boxesWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.4;
  }

  GestureDetector buidPostsGestureDetector (BuildContext context) {
    return GestureDetector (
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostsList(),
          ),
        );
      },
      child: buidContainerPostsLink(context),
    );
  }

  GestureDetector buidDirectoryGestureDetector (BuildContext context) {
    return GestureDetector (
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProvincesList(),
          ),
        );
      },
      child: buidContainerDirectoryLink(context),
    );
  }

  Container buidContainerPostsLink(BuildContext context){
    return Container(
      width: boxesWidth(context),
      height: boxesWidth(context),
      margin: EdgeInsets.all(8.0),
      decoration:
      BoxDecoration(
        color: Colors.lightBlue[900],
      ),
      child:
      Center(
        child: Text(
          "Actualités",
          textAlign: TextAlign.center,
          /*overflow: TextOverflow.ellipsis,*/
          style: TextStyle(fontSize:20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Container buidContainerDirectoryLink(BuildContext context){
    return Container(
      width: boxesWidth(context),
      height: boxesWidth(context),
      margin: EdgeInsets.all(8.0),
      decoration:
      BoxDecoration(
        color: Colors.yellow[900],
      ),
      child:
      Center(
          child: Text(
            "Les centres d'assistance",
            textAlign: TextAlign.center,
            /*overflow: TextOverflow.ellipsis,*/
            style: TextStyle(fontSize:20.0, fontWeight: FontWeight.bold, color: Colors.white),
          )
      ),
    );
  }

}