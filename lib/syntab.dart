import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proj/data/funtion.dart';
import 'OGandClasses.dart';
import 'champion.dart';
import 'data/urls.dart';

class SynTab extends StatelessWidget {
  Future<OG> fetchPost(String ogin) async {
    final response = await http.get(solomidOriginbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return OG.fromJson(a[ogin]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  Future<Classes> fetchPost2(String cls) async {
    final response = await http.get(solomidClassesbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return Classes.fromJson(a[cls]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  Future<ChampionData> fetchPost3(String name) async {
    final response = await http.get(solomidChampionbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return ChampionData.fromJson(a[name]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: ListView.builder(
          itemCount: origins.length,
          itemBuilder: (BuildContext context, int index) {
            return FutureBuilder(
              future: fetchPost(origins[index]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Card(
                    elevation: 5.0,
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: Row(children: <Widget>[
                          Image.network(orgUrlBase.replaceAll(
                              'placeholder', snapshot.data.name.toLowerCase())),
                        ])),
                        Row(
                          children: <Widget>[Text(snapshot.data.name)],
                        ),
                        if (snapshot.data.description != null)
                          Text(snapshot.data.description),
                        if (snapshot.data.description == null)
                          Text(snapshot.data.bonuses[0]['effect']),
                        Container(
                            height: MediaQuery.of(context).size.width / 10,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  VerticalDivider(
                                color: Colors.black,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: all_syn[snapshot.data.key].length,
                              itemBuilder: (BuildContext context, int index) {
                                return DecoratedBox(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: getColorCode(
                                                all_syn[snapshot.data.key]
                                                    [index]))),
                                    child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child: Image.network(
                                          'http://ddragon.leagueoflegends.com/cdn/9.16.1/img/champion/' +
                                              all_syn[snapshot.data.key][index]
                                                  .replaceAll(" ", "") +
                                              '.png',
                                        )));
                              },
                            ))
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Container(
            height: 100,
            width: 100,
            child: Center(child: CircularProgressIndicator()));
              },
            );
          },                                                  
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: classes.length,
          itemBuilder: (BuildContext context, int index) {
            return FutureBuilder(
              future: fetchPost2(classes[index]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Card(
                    elevation: 5.0,
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: Row(children: <Widget>[
                          Image.network(orgUrlBase.replaceAll(
                              'placeholder', snapshot.data.name.toLowerCase())),
                        ])),
                        Row(
                          children: <Widget>[Text(snapshot.data.name)],
                        ),
                        if (snapshot.data.description != null)
                          Text(snapshot.data.description),
                        if (snapshot.data.description == null)
                          Text(snapshot.data.bonuses[0]['effect']),
                        Container(
                            height: MediaQuery.of(context).size.width / 10,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  VerticalDivider(
                                color: Colors.black,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: all_syn[snapshot.data.key].length,
                              itemBuilder: (BuildContext context, int index) {
                                return DecoratedBox(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: getColorCode(
                                                all_syn[snapshot.data.key]
                                                    [index]))),
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                        child: Image.network(
                                      'http://ddragon.leagueoflegends.com/cdn/9.16.1/img/champion/' +
                                          all_syn[snapshot.data.key][index]
                                              .replaceAll(" ", "") +
                                          '.png',
                                    )));
                              },
                            ))
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Container(
            height: 100,
            width: 100,
            child: Center(child: CircularProgressIndicator()));
              },
            );
          },
        ),
      )
    ]);
  }
}
