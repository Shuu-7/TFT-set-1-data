import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './urls.dart';

Future<String> getOriginImage(String og) async {
    String data;
    var res = await http.get(Uri.parse(solomidOriginbase), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    data = resBody['og']['accentChampionImage'];
    return data;
  }

Future<String> getClassImage(String cl) async {
    String data;
    var res = await http.get(Uri.parse(solomidClassesbase), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    data = resBody['cl']['accentChampionImage'];
    return data;
  }

Future<dynamic> getSRChampData(String name) async {
  var res = await http.get(Uri.parse(solomidChampionbase), headers: {"Accept":"applications/json"});
  return res;
}