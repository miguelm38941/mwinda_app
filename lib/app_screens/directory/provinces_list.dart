import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:mwinda_app/app_screens/directory/zones_list.dart';
import 'package:mwinda_app/app_screens/my_home_page.dart';
import 'dart:async';
import 'dart:convert';
import 'Province.dart';

class ProvincesList extends StatefulWidget {
  @override
  _ProvincesListState createState() {
    // TODO: implement createState
    return new _ProvincesListState();
  }

}


class _ProvincesListState extends State<ProvincesList> {

  // Prepare Data Source
  /*List<String> showProvinces() {
    var items = List<String>.generate(1000, (counter) => "Item $counter");
    return items;
  }*/

  Future<List<Province>> showProvinces() async {
    var data = await http.get('https://jsonplaceholder.typicode.com/posts');
    var dataDecoded = json.decode(data.body);

    List<Province> provinces = List();
    dataDecoded.forEach((province){
      String title = province["title"];
      if(title.length>25){
        title = province["title"].substring(1,25) + "...";
      }
      String body = province["body"].replaceAll(RegExp(r'\n'), " ");
      provinces.add(new Province(title, body));
      //debugPrint("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" + province["title"]);
    });
    return provinces;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Les provinces"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: FutureBuilder(
              future: showProvinces(),
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
                                            builder: (context) => ZonesList(province: snapshot.data[index]),
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