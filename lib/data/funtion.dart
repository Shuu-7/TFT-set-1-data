import 'package:flutter/material.dart';

import 'champList.dart';

Color getColorCode(String champ){
  int cost = costToChamp[champ];
  switch(cost){
    case 1: 
    return Color(0xff68747a);
    break;
    case 2: 
    return Color(0xff207800);
    break;
    case 3: 
    return Color(0xff015560);
    break;
    case 4: 
    return Color(0xff560856);
    break;
    case 5: 
    return Color(0xff935206);
    break;
  }
}