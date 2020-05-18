import 'package:proj/data/funtion.dart';
import 'package:proj/tabs.dart';

import 'data/champList.dart';
import 'package:flutter/material.dart';
import 'package:proj/champion.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'data/urls.dart';
import 'champion.dart';
import 'routes.dart';
import 'slidingDrawer.dart';
import 'syntab.dart';

//Home 
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

//Home default state 
class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String origin;
  String classes;

  TabController controller;
  //querying the solomid resources

  Future<ChampionData> fetchPost(String name) async {
    final response = await http.get(solomidChampionbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return ChampionData.fromJson(a[name]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  var championdata;
  var cimage;
  List champs = champ;
  bool cflag = false;
  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
    for (int i = 0; i < champs.length; i++) {
      ChampionService ob1 = new ChampionService();
      ob1.getChampionFromFirestore(champs[i]).get().then((docs) {
        setState(() {
          cflag = true;
        });
        if (docs.exists) {
          cflag = true;
          cimage = ob1.getChampionImage(champs[i]);
          championdata = docs.data;
          print(championdata);
        }
      });
    }
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(cflag);
    return Scaffold(
      appBar: AppBar(),
      drawer: SlidingDrawer(),
      body: TabBarView(
        children: <Widget>[
          Container(
              height: double.infinity,
              child: cflag
                  ? new ListView.builder(
                      itemCount: champs.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return new Container(
                            height: 70,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, champRoute,
                                      arguments:
                                          champs[index].replaceAll(" ", ""));
                                },
                                child: Card(
                                  elevation: 7.0,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      DecoratedBox(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 3,
                                                  color: getColorCode(
                                                      champs[index]))),
                                          child: Padding(
                                              padding: EdgeInsets.all(3),
                                              child: Image.network(
                                                'http://ddragon.leagueoflegends.com/cdn/9.16.1/img/champion/' +
                                                    champs[index]
                                                        .replaceAll(" ", "") +
                                                    '.png',
                                              ))),
                                      Center(child: Text(champs[index])),
                                      //Image.network(orgUrlBase.replaceAll('placeholder', ))
                                      FutureBuilder(
                                          future: fetchPost(champs[index]
                                              .replaceAll(" ", "")),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Center(
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      // scrollDirection: Axis.horizontal,
                                                      // shrinkWrap: true,
                                                      children: <Widget>[
                                                    Column(children: <Widget>[
                                                      Image.network(goldWhite,width: 30,height: 30,),
                                                      Divider(),
                                                      Text(" " +
                                                          snapshot.data.cost
                                                              .toString() +
                                                          "  "),
                                                    ]),
                                                    VerticalDivider(),
                                                   
                                                      Image.network(orgUrlBase
                                                          .replaceAll(
                                                              'placeholder',
                                                              snapshot
                                                                  .data.origin[0])
                                                          .toLowerCase()),
                                                      Text(
                                                          snapshot.data.origin[0] +
                                                              "  "),
                                                    VerticalDivider(),
                                                    Column(children: <Widget>[
                                                      Image.network(orgUrlBase
                                                          .replaceAll(
                                                              'placeholder',
                                                              snapshot
                                                                  .data.classes[0])
                                                          .toLowerCase()),
                                                      Text(snapshot
                                                          .data.classes[0]),
                                                    ]),
                                                  ]));
                                            } else if (snapshot.hasError) {
                                              return Text("${snapshot.error}");
                                            }
                                            // By default, show a loading spinner.
                                            return Container(
                                                height: 100,
                                                width: 100,
                                                child: Center(
                                                    child:
                                                        CircularProgressIndicator()));
                                          })
                                    ],
                                  ),
                                )));
                      },
                    )
                  : Center(
                      child: Container(
                          height: 100,
                          width: 100,
                          child: Center(child: CircularProgressIndicator())))),
          ItemTab(),
          SynTab()
        ],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        child: TabBar(
          tabs: <Tab>[
            Tab(icon: Image.network(champImage)),
            Tab(
              icon: Image.network(itemImage),
            ),
            Tab(
              icon: Image.network(org),
            )
          ],
          controller: controller,
        ),
      ),
    );
  }
}
