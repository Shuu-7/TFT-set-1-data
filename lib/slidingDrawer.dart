import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proj/form.dart';
import 'package:proj/routes.dart';

class SlidingDrawer extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        Container(
          height: 100,
          child: DrawerHeader(child: Text('Navigaton')),
        ),
        MyCustomForm(),
        Divider(),
        Text('Champions'),
        Divider(),
        Row(
          children: <Widget>[
            Icon(Icons.play_arrow),
            VerticalDivider(),
            Text('Items'),
          ],
        ),
        Divider(),
        Row(
          children: <Widget>[
            Icon(Icons.library_books),
            VerticalDivider(),
            Text('Patch Notes'),
          ],
        ),
        Divider(),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, lb);
          },
          child: 
        Row(
          children: <Widget>[
            Icon(Icons.trip_origin),
            VerticalDivider(),
            Text('Leaderboards')
          ],
        ),),
        Divider(),
        Row(
          children: <Widget>[
            Icon(Icons.settings),
            VerticalDivider(),
            Text('Settings')
          ],
        )
      ],
    ));
  }
}
