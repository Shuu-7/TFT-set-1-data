import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
class Champion {
  int cost;
  String name;
  List<String> origin;
  List<int> dmg;
  List<int> dps;
  int mana;
  int range;
  List<int> health;
  int mr;
  int armor;
  int atkspd;


}

//class to store the cxha,pion data fetched from 
class ChampionData {
  final int cost;
  final String name;
  final List<dynamic> origin;
  final List<dynamic> classes;
  final int  dmg;
  final int dps;
  final int health;
  final int armor;
  final int mr;
  final double atkspd;
  final int range;
  final String abilityName;
  final String abilityDes;
  final String abilityType;
  final int mana;
  final List<dynamic> abilityEffects;
  final List<dynamic> itemRecom;
  ChampionData({this.cost, this.name, this.origin, this.classes, this.dmg, this.dps,this.health,this.armor,this.mr,this.atkspd,this.range,this.abilityName,this.abilityDes,this.abilityType,this.mana,
  this.abilityEffects,this.itemRecom});
  
  factory ChampionData.fromJson(Map<String, dynamic> json) {
    return ChampionData(
      cost: json['cost'],
      name: json['name'],
      origin: json['origin'],
      classes: json['class'],
      dmg: json['stats']['offense']['damage'],
      dps: json['stats']['offense']['dps'],
      health: json['stats']['defense']['health'],
      armor: json['stats']['defense']['armor'],
      mr: json['stats']['defense']['magicResist'],
      atkspd: json['stats']['offense']['attackSpeed'].toDouble(),
      range: json['stats']['offense']['range'],
      abilityName: json['ability']['name'],
      abilityDes: json['ability']['description'],
      abilityType: json['ability']['type'],
      mana: json['ability']['manaCost'],
      abilityEffects: json['ability']['stats'],
      itemRecom: json['items']
    );
  }
  
}

class ChampionService {
  
   getChampionFromFirestore(String name){
    DocumentReference _db = Firestore.instance.document('champions/'+name);
    return _db;
  }

  getChampionImage(String name){
    // String baseurl = 'https://api-v3.igdb.com';
    // String igdb = '4ab3b68a0d329f4c240ed806cd709263';
    return 'http://ddragon.leagueoflegends.com/cdn/6.24.1/img/champion/'+name+'.png';

  }
}

class ItemData {
  final String key;
  final String name;
  final String type;
  final String bonus;
  final int tier;
  final int depth;
  final LinkedHashMap<String,dynamic> stats;
  final String kind;
  // final LinkedHashMap<int,dynamic> buildsInto;
  final List<dynamic> buildsInto;
  // final LinkedHashMap<int,dynamic> champs;
  final List<dynamic> champs;
  ItemData({this.key,this.name,this.type,this.bonus,this.tier,this.depth,this.stats,this.kind,this.buildsInto,this.champs});
  
  factory ItemData.fromJson(Map<String, dynamic> json) {
    return ItemData(
      key: json['key'],
      name: json['name'],
      type: json['type'],
      bonus: json['bonus'],
      tier: json['tier'],
      depth: json['depth'],
      stats: json['stats'][0],
      kind: json['kind'],
      buildsInto: json['buildsInto'],
      champs: json['champs']
     // buildsInto: json['buildsInto'],
      // champs: json['champs']
    );
  }
  
}

class FinalItemData {
  final String key;
  final String name;
  final String type;
  final String bonus;
  final int tier;
  final int depth;
  final String kind;
  // final LinkedHashMap<int,dynamic> buildsInto;
  final List<dynamic> buildsFrom;
  // final LinkedHashMap<int,dynamic> champs;
  final List<dynamic> champs;
  FinalItemData({this.key,this.name,this.type,this.bonus,this.tier,this.depth,this.kind,this.buildsFrom,this.champs});
  
  factory FinalItemData.fromJson(Map<String, dynamic> json) {
    return FinalItemData(
      key: json['key'],
      name: json['name'],
      type: json['type'],
      bonus: json['bonus'],
      tier: json['tier'],
      depth: json['depth'],
      kind: json['kind'],
      buildsFrom: json['buildsInto'],
      champs: json['champs']
     // buildsInto: json['buildsInto'],
      // champs: json['champs']
    );
  }
  
}
