import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'champion.dart';
import './data/urls.dart';

class DataCard extends StatelessWidget {
  final String name;
  DataCard(this.name);

//color schemes baased on champion rarity
  final cardTS = TextStyle(fontSize: 20, fontFamily: 'Comic Sans');
  List<Color> colors = [
    Color(0xff68747a),
    Color(0xff207800),
    Color(0xff015560),
    Color(0xff560856),
    Color(0xff935206)
  ];
  Future<ChampionData> fetchPost(String name) async {
    final response = await http.get(solomidChampionbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return ChampionData.fromJson(a[name]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.name),
        ),
        body: FutureBuilder(
            future: fetchPost(this.name),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(children: <Widget>[
                  DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3, color: colors[snapshot.data.cost - 1])),
                      child: Padding(
                          padding: EdgeInsets.all(3),
                          child: Stack(children: <Widget>[
                            Image.network(dDragonSplash.replaceAll(
                                'placeholder', this.name)),
                            Image.asset(
                              'assets/Tier-' +
                                  snapshot.data.cost.toString() +
                                  '.png',
                              width: double.infinity,
                              height: 16,
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Text(this.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Open Sans',
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900)),
                            ),
                            Positioned(
                                right: 10,
                                bottom: 10,
                                child: Row(
                                  children: <Widget>[
                                    Image.network(
                                      goldWhite,
                                      width: 32,
                                      height: 32,
                                    ),
                                    VerticalDivider(),
                                    Text(snapshot.data.cost.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Open Sans',
                                            fontSize: 25,
                                            fontWeight: FontWeight.w900)),
                                    VerticalDivider(),
                                    Tooltip(
                                        message: snapshot.data.classes[0],
                                        child: Image.network(orgUrlBase
                                            .replaceAll('placeholder',
                                                snapshot.data.classes[0])
                                            .toLowerCase())),
                                    VerticalDivider(),
                                    Tooltip(
                                        message: snapshot.data.origin[0],
                                        child: Image.network(orgUrlBase
                                            .replaceAll('placeholder',
                                                snapshot.data.origin[0])
                                            .toLowerCase())),
                                  ],
                                ))
                          ]))),
                  SizedBox(
                      width: double.infinity,
                      child: Card(
                          elevation: 6.0,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Image.asset('assets/Health_icon_2.png'),
                                  Text(
                                      'Health : ' +
                                          snapshot.data.health.toString(),
                                      style: cardTS),
                                ]),
                                Divider(),
                                Row(children: <Widget>[
                                  Image.asset('assets/Armor_icon_2.png'),
                                  Text(
                                      'Armor : ' +
                                          snapshot.data.armor.toString(),
                                      style: cardTS),
                                ]),
                                Divider(),
                                Row(children: <Widget>[
                                  Image.network(mrBase),
                                  Text(
                                      'Magic Resist : ' +
                                          snapshot.data.mr.toString(),
                                      style: cardTS),
                                ]),
                                Divider(),
                                Row(children: <Widget>[
                                  Image.network(
                                    dmgBase,
                                    width: 32,
                                    height: 32,
                                  ),
                                  Text(
                                      'Damage : ' +
                                          snapshot.data.dmg.toString(),
                                      style: cardTS),
                                ]),
                                Divider(),
                                Row(children: <Widget>[
                                  Image.asset(
                                    'assets/DPS-icon.png',
                                    height: 32,
                                    width: 32,
                                  ),
                                  Text(
                                    'DPS : ' + snapshot.data.dps.toString(),
                                    style: cardTS,
                                  ),
                                ]),
                                Divider(),
                                Row(children: <Widget>[
                                  Image.network(atkspdBase),
                                  Text(
                                    'Attack Speed : ' +
                                        snapshot.data.atkspd.toString(),
                                    style: cardTS,
                                  ),
                                ]),
                                Divider(),
                                Row(children: <Widget>[
                                  Image.network(
                                    rangeBase,
                                    width: 25,
                                    height: 25,
                                  ),
                                  Text(
                                    'Range : ' + snapshot.data.range.toString(),
                                    style: cardTS,
                                  )
                                ]),
                              ]))),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Ability',
                          style: cardTS,
                        ),
                        Divider(),
                        Row(
                          children: <Widget>[
                            Image.network(abilityImage.replaceAll(
                                'placeholder', snapshot.data.abilityName)),
                            Text(snapshot.data.abilityName, style: cardTS)
                          ],
                        ),
                        Text(
                          'Description : ' + snapshot.data.abilityDes,
                          style: cardTS,
                        ),
                        Divider(),
                        Row(
                          children: <Widget>[
                            Image.network(
                              'https://img.rankedboost.com/wp-content/plugins/league/assets/tft/Mana.png',
                              scale: .5,
                            ),
                            VerticalDivider(),
                            Text(
                              'Mana Cost : ',
                              style: cardTS,
                            ),
                            VerticalDivider(),
                            Text(
                              snapshot.data.mana.toString(),
                              style: cardTS,
                            ),
                          ],
                        ),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.abilityEffects.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: <Widget>[
                                Divider(),
                                Text(
                                  snapshot.data.abilityEffects[index]['type']
                                          .toString() +
                                      " : ",
                                  style: cardTS,
                                ),
                                VerticalDivider(),
                                Text(
                                  snapshot.data.abilityEffects[index]['value']
                                      .toString(),
                                  style: cardTS,
                                )
                              ],
                            );
                          },
                        ),
                        Divider(),
                        Center(
                          child: Text(
                            'Best Items',
                            style: cardTS,
                          ),
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Tooltip(
                              child: Image.asset('assets/' +
                                  snapshot.data.itemRecom[0] +
                                  '.png'),
                              message: snapshot.data.itemRecom[0],
                            ),
                            Tooltip(
                              child: Image.asset('assets/' +
                                  snapshot.data.itemRecom[1] +
                                  '.png'),
                              message: snapshot.data.itemRecom[1],
                            ),
                            Tooltip(
                              child: Image.asset('assets/' +
                                  snapshot.data.itemRecom[2] +
                                  '.png'),
                              message: snapshot.data.itemRecom[2],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ]);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return Center(child: CircularProgressIndicator());
            }));
  }
}
