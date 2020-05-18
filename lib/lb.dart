import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'SumData.dart';
import 'auto_size_text.dart';
import 'data/leaderboarddata.dart';
import 'data/urls.dart';
import 'topSecretAPIKey.dart';

class LB extends StatelessWidget {
  Future<List<SampleLBData>> fetchPost() async {
    final response = await http.get(
        'https://oc1.api.riotgames.com/lol/league/v4/challengerleagues/by-queue/RANKED_TFT?api_key=' +
            key);
    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      var tmpList = new List<SampleLBData>();
      for (int i = 0; i < a['entries'].length; i++) {
        SampleLBData tmp = SampleLBData.fromJson(a['entries'][i]);
        tmpList.insert(i, tmp);
      }
      tmpList.sort((a, b) => b.lp.compareTo(a.lp));
      return tmpList;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Text('LeaderBoards'),
      FutureBuilder(
        future: fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return FutureBuilder(
                  future: fetchSumData('oc1', snapshot.data[index].name),
                  builder: (context, snap) {
                    if (snap.hasData) {
                      return Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            child: Row(
                              children: <Widget>[
                                Text((index + 1).toString() + '. '),
                                VerticalDivider(),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      ddragonProfileIcon.replaceAll(
                                          'placeholder',
                                          snap.data.profileIconData
                                              .toString())),
                                ),
                                VerticalDivider(),
                                // Container(
                                //   child: ConstrainedBox(
                                //     constraints: BoxConstraints(
                                //       minWidth: 100.0,
                                //       maxWidth: 100.0,
                                //       minHeight: 30.0,
                                //       maxHeight: 100.0,
                                //     ),
                                //     child: AutoSizeText(
                                //       snapshot.data[index].name,
                                //       style: TextStyle(fontSize: 15.0),
                                //     ),
                                //   ),
                                // ),
                                VerticalDivider(),
                                Image.network(rankedSmol.replaceAll(
                                    'placeholder', 'challenger'))
                              ],
                            ),
                          ));
                    } else if (snap.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Center(
                        child: Container(
                      height: 150,
                      width: 150,
                      child: CircularProgressIndicator(),
                    ));
                  },
                );

                //Text(snapshot.data[index].name);
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    ]));
  }
}
