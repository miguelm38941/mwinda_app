import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:mwinda_app/app_screens/my_home_page.dart';
import 'dart:async';
import 'dart:convert';
import 'centre_detail.dart';
import 'zone.dart';
import 'centre.dart';

class CentresList extends StatefulWidget {
  // Declare a field that holds the Zone.
  final Zone zone;

  // In the constructor, require a Zone.
  CentresList({Key key, @required this.zone}) : super(key: key);

  @override
  _CentresListState createState() {
    // TODO: implement createState
    return new _CentresListState(zone);
  }

}


class _CentresListState extends State<CentresList> {

  Zone zone;
  // Constructor
  _CentresListState(zone){
    this.zone = zone;
  }

  // Prepare Data Source
  /*List<String> showProvinces() {
    var items = List<String>.generate(1000, (counter) => "Item $counter");
    return items;
  }*/

  Future<List<Centre>> showCentres() async {
    var data = await http.get('https://jsonplaceholder.typicode.com/posts');
    var dataDecoded = json.decode(data.body);

    List<Centre> centres = List();
    dataDecoded.forEach((centre){
      String id = "1";//centre["id"];
      String title = centre["title"];
      if(title.length>25){
        title = centre["title"].substring(1,25) + "...";
      }
      String body = centre["body"].replaceAll(RegExp(r'\n'), " ");
      centres.add(new Centre(id, title, body));
    });
    return centres;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sélectionnez un centre"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: FutureBuilder(
              future: showCentres(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  ListTile(
                                    //selected: true,
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                    title: Text(snapshot.data[index].title, style: TextStyle(fontSize: 22.0)),
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CentreDetail(centre: snapshot.data[index]),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            )
                        );
                      }
                  );
                } else {
                  return Align(
                    alignment: FractionalOffset.center,
                    child: CircularProgressIndicator(),
                  );
                };
              })
      ),
    );
  }

}