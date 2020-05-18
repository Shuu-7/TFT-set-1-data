
import 'dart:collection';

class OG {
  final String key;
  final String name;
  final String description;
  final List<dynamic> bonuses;
  
  OG({this.key,this.name,this.description,this.bonuses});
  
  factory OG.fromJson(Map<String, dynamic> json) {
    return OG(
      key: json['key'],
      name: json['name'],
      description: json['description'],
      bonuses: json['bonuses']
     // buildsInto: json['buildsInto'],
      // champs: json['champs']
    );
  }
}

List<String> origins = [
  'demon',
  'dragon',
  'exile',
  'glacial',
  'hextech',
  'imperial',
  'noble',
  'ninja',
  'pirate',
  'phantom',
  'robot',
  'void',
  'wild',
  'yordle'
//    'assassin',
//   'blademaster',
//   'brawler',
//   'elementalist',
//   'guardian',
//   'gunslinger',
//   'knight',
//   'ranger',
//   'shapeshifter',
//   'sorcerer'
// ];
];

List<String> classes = [
  'assassin',
  'blademaster',
  'brawler',
  'elementalist',
  'guardian',
  'gunslinger',
  'knight',
  'ranger',
  'shapeshifter',
  'sorcerer'
];

class Classes {
  final String key;
  final String name;
  final String description;
  final List<dynamic> bonuses;
  
  Classes({this.key,this.name,this.description,this.bonuses});
  
  factory Classes.fromJson(Map<String, dynamic> json) {
    return Classes(
      key: json['key'],
      name: json['name'],
      description: json['description'],
      bonuses: json['bonuses']
     // buildsInto: json['buildsInto'],
      // champs: json['champs']
    );
  }
}

Map<String,List<String>> all_syn= {
  'demon' : [
    'Elise',
    'Evelynn',
    'Brand',
    'Aatrox',
    'Varus',
    'Morgana',
    'Swain'
  ],
  'dragon' : [
    'Aurelion Sol',
    'Shyvana'
  ],
  'exile' : [
    'Yasuo'
  ],
  'glacial' : [
    'Ashe',
    'Braum',
    'Lissandra',
    'Volibear',
    'Sejuani',
    'Anivia'
  ],
  'hextech' : [
    'Camille',
    'Jayce',
    'Vi',
    'Jinx'
  ],
  'imperial' : [
    'Darius',
    'Draven',
    'Katarina',
    'Swain'
  ],
  'noble' : [
    'Fiora',
    'Garen',
    'Vayne',
    'Leona',
    'Kayle',
    'Lucian'
  ],
  'ninja' : [
    'Zed',
    'Akali',
    'Shen',
    'Kennen'
  ],
  'pirate' : [
    'Gangplank',
    'Miss Fortune',
    'Graves',
    'Pyke',
    'Twisted Fate'
  ],
  'phantom' : [
    'Mordekaiser',
    'Kindred',
    'Karthus'
  ],
  'robot': [
    'Blitzcrank'
  ],
  'void' : [
    'Kassadin',
    'Khazix',
    'Chogath',
    'RekSai'
  ],
  'wild': [
    'Gnar',
    'Ahri',
    'Rengar',
    'Nidalee',
    'Warwick'
  ],
  'yordle' : [
    'Tristana',
    'Lulu',
    'Kennen',
    'Gnar',
    'Veigar',
    'Poppy'
  ],
  'assassin':[
    'Zed',
    'Akali',
    'Khazix',
    'Pyke',
    'Evelynn',
    'Katarina',
    'Rengar'
  ],
  'blademaster' : [
    'Camille',
    'Shen',
    'Fiora',
    'Aatrox',
    'Gangplank',
    'Draven',
    'Yasuo'
  ],
  'brawler' : [
    'Warwick',
    'Blitzcrank',
    'RekSai',
    'Vi',
    'Volibear',
    'Chogath'
  ],
  'elementalist':[
    'Lissandra',
    'Kennen',
    'Brand',
    'Anivia'
  ],
  'guardian':[
    'Leona',
    'Braum'
  ],
  'gunslinger':[
    'Lucian',
    'Tristana',
    'Miss Fortune',
    'Graves',
    'Jinx',
    'Gangplank'
  ],
  'knight' : [
    'Darius',
    'Garen',
    'Mordekaiser',
    'Poppy',
    'Sejuani',
    'Kayle'
  ],
  'ranger': [
    'Varus',
    'Vayne',
    'Ashe',
    'Kindred'
  ],
  'shapeshifter':[
    'Shyvana',
    'Jayce',
    'Gnar',
    'Nidalee',
    'Elise',
    'Swain'
  ],
  'sorcerer':[
    'Kassadin',
    'Ahri',
    'Lulu',
    'Aurelion Sol',
    'Morgana',
    'Veigar',
    'Karthus'
  ]
};