import 'dart:convert';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proj/data/urls.dart';
import 'package:proj/topSecretAPIKey.dart';
import 'SumData.dart';

class SumCard extends StatelessWidget {
  final String sumname;
  final String sumRegion;
  SumCard(this.sumname, this.sumRegion);

  String getRegionalEndPoint(String sumRegion){
    switch (sumRegion) {
      case 'OCE':
        return('oc1');
        break;
      case 'NA':
       return('na1');
        break;
      case 'EUNE':
      return 'eun1';
      break;
      case 'KR':
      return 'kr';
      break;
      case 'EUW':
      return 'euw1';
      break;
      case 'JPN':
      return 'jp1';
      break;
      case 'LAS':
      return 'la2';
      break;
      case 'BR':
      return 'br1';
      break;
      case 'RU':
      return 'ru1';
      break;
      case 'TUR':
      return 'tr1';
      break;
      default:
      return '404';
      
    }
  }
  Future<SummonerData> fetchSumData(String region, String name) async {
    final response = await http.get('https://' +
        region +
        '.api.riotgames.com/lol/summoner/v4/summoners/by-name/' +
        name +
        '?api_key=' +
        key);
    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return SummonerData.fromJson(a);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<LeagueData> fetchLegData(String region, String id) async {
    final response = await http.get('https://' +
        region +
        '.api.riotgames.com/lol/league/v4/entries/by-summoner/' +
        id +
        '?api_key=' +
        key);
    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      for (int i = 0; i < a.length; i++) {
        if (a[i]['queueType'] == 'RANKED_TFT') {
          var b = a[i];
          return LeagueData.fromJson(b);
        }
      }
      return LeagueData.fromJson(a);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
  List<CircularStackEntry> data = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Q1'),
        new CircularSegmentEntry(1000.0, Colors.green[200], rankKey: 'Q2'),
        new CircularSegmentEntry(2000.0, Colors.blue[200], rankKey: 'Q3'),
        new CircularSegmentEntry(1000.0, Colors.yellow[200], rankKey: 'Q4'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
        future: fetchSumData(getRegionalEndPoint(sumRegion), sumname),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // return Text(snapshot.data.profileIconData.toString());
            return Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Card(
                    child: Column(children: <Widget>[
                  Divider(),
                  Row(
                    children: <Widget>[
                      VerticalDivider(),
                      Stack(children: <Widget>[
                        CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                ddragonProfileIcon.replaceAll('placeholder',
                                    snapshot.data.profileIconData.toString()))),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 12,
                              child:
                                  Text(snapshot.data.summonerLevel.toString()),
                            ))
                      ]),
                      VerticalDivider(),
                      Text(
                        snapshot.data.name,
                        style: TextStyle(
                            fontFamily: 'Comic Sans',
                            fontSize: 25,
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  FutureBuilder(
                    future: fetchLegData(getRegionalEndPoint(sumRegion), snapshot.data.id),
                    builder: (context, snap2) {
                      if (snap2.hasData) {
                        return Container(
                            padding: EdgeInsets.all(7.0),
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                              color: Color.fromRGBO(34, 49, 51,0.5),
                                elevation: 5.0,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(children: <Widget>[
                                        Stack(children: <Widget>[
                                        AnimatedCircularChart(
                                          key: _chartKey,
                                          size: const Size(150, 150),
                                          initialChartData: <
                                              CircularStackEntry>[
                                            new CircularStackEntry(
                                              <CircularSegmentEntry>[
                                                new CircularSegmentEntry(
                                                  snap2.data.lp.toDouble(),
                                                  Colors.blue[400],
                                                  rankKey: 'completed',
                                                ),
                                                new CircularSegmentEntry(
                                                  (100 - snap2.data.lp)
                                                      .toDouble(),
                                                  Colors.blueGrey[600],
                                                  rankKey: 'remaining',
                                                ),
                                              ],
                                              rankKey: 'progress',
                                            ),
                                          ],
                                          chartType: CircularChartType.Radial,
                                          edgeStyle: SegmentEdgeStyle.round,
                                          percentageValues: true,
                                        ),
                                        Positioned.fill(
                                          child: Image.network(
                                              rankedSmol.replaceAll(
                                                  'placeholder',
                                                  snap2.data.tier
                                                      .toLowerCase())),
                                        )
                                      ]),
                                      ],),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                      Row(children:<Widget>[ Text(snap2.data.tier + "  "),
                                      Text(snap2.data.rank),]),
                                      Text(snap2.data.lp.toString()),
                                      Row(children: <Widget>[
                                        Text(snap2.data.wins.toString()+'W '+snap2.data.losses.toString()+'L'),
                                      ],),
                                      
                                      ])
                                    ])));
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },
                  )
                ])));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    ));
  }
}
