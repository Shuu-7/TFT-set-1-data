class SampleLBData{
  String name;
  String uid;
  int lp;
  int win;
  int loss;
  String rank;
  SampleLBData({this.name,this.uid,this.lp,this.win,this.loss,this.rank});
  factory SampleLBData.fromJson(Map<String, dynamic> json) {
    return SampleLBData(name: json['summonerName'],
    uid: json['summonerId'],
    lp: json['leaguePoints'],
    win: json['wins'],
    loss: json['losses'],
    rank: json['rank']
    );
  }
}