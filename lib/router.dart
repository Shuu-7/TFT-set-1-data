import 'package:flutter/material.dart';
import 'package:proj/routes.dart';
import 'package:proj/sumcard.dart';

import 'datacard.dart';
import 'lb.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case champRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => DataCard(data));
      case sumRoute:
        var data = settings.arguments as List;
        return MaterialPageRoute(builder: (_) => SumCard(data[0],data[1]));
      case lb:
        return MaterialPageRoute(builder: (_)=> LB());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}