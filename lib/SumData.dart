class SummonerData {
  final String id;
  final String accountId;
  final String puuid;
  final String name;
  final int profileIconData;
  final int summonerLevel;
  SummonerData({this.id,this.accountId,this.puuid,this.name,this.profileIconData,this.summonerLevel});
  
  factory SummonerData.fromJson(Map<String, dynamic> json) {
    return SummonerData(
      id: json['id'],
      accountId: json['accountId'],
      puuid: json['puuid'],
      name: json['name'],
      profileIconData: json['profileIconId'],
      summonerLevel: json['summonerLevel']
    );
  }
}

class LeagueData {
  final String leagueId;
  final String tier;
  final String rank;
  final int lp;
  final int wins;
  final int losses;
  final bool veteran;
  final bool inactive;
  final bool freshBlood;
  final bool hotStreak;
  LeagueData({this.leagueId,this.tier,this.rank,this.lp,this.wins,this.losses,this.veteran,this.inactive,this.freshBlood,this.hotStreak});
  
  factory LeagueData.fromJson(Map<String, dynamic> json) {
    return LeagueData(
      leagueId: json['leagueId'],
      tier: json['tier'],
      rank: json['rank'],
      lp: json['leaguePoints'],
      wins: json['wins'],
      losses: json['losses'],
      veteran: json['veteran'],
      inactive: json['inactive'],
      freshBlood: json['freshBlood'],
      hotStreak: json['hotStreak']
    );
  }
}