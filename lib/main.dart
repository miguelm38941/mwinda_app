import 'package:flutter/material.dart';

import 'app_screens/app_index.dart';
import 'app_screens/my_home_page.dart';
import 'app_screens/my_home_screen.dart';
import 'app_screens/posts/posts_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenue sur Mwinda app',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightBlue,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        appBar: AppBar(title: Text('Mwinda App')),
        body: AppIndex(), //PostsList(), //getListView(), //MyHomeScreen(),
      ),
    );
  }

  // Prepare Data Source
  List<String> getListElements() {
    var items = List<String>.generate(1000, (counter) => "Item $counter");
    return items;
  }
  
  Widget getListView() {

    var listItems = getListElements();

    var listView = ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text(listItems[index]),
            onTap: (){
              debugPrint('${listItems[index]} was tapped');
            },
          );
        }
    );

    return listView;
  }
}

