import 'package:flutter/material.dart';
import 'package:proj/data/champList.dart';
import 'itemtabs.dart';

class ItemTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ItemTab();
  }
}

class _ItemTab extends State<ItemTab> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();

    controller = TabController(length: 9, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    return Container(
        // height: ,
        width: MediaQuery.of(context).size.width,
        child: Column(children: <Widget>[
          TabBar(
            tabs: <Tab>[
              Tab(
                  icon: Image.asset(
                      'assets/' + baseItems[0].toLowerCase() + '.png',
                      width: _screenWidth / 4)),
              Tab(
                  icon: Image.asset(
                      'assets/' + baseItems[1].toLowerCase() + '.png',
                      width: _screenWidth / 9)),
              Tab(
                  icon: Image.asset(
                      'assets/' + baseItems[2].toLowerCase() + '.png',
                      width: _screenWidth / 9)),
              Tab(
                  icon: Image.asset(
                      'assets/' + baseItems[3].toLowerCase() + '.png',
                      width: _screenWidth / 9)),
              Tab(
                  icon: Image.asset(
                      'assets/' + baseItems[4].toLowerCase() + '.png',
                      width: _screenWidth / 9)),
              Tab(
                  icon: Image.asset(
                      'assets/' + baseItems[5].toLowerCase() + '.png',
                      width: _screenWidth / 9)),
              Tab(
                  icon: Image.asset(
                      'assets/' + baseItems[6].toLowerCase() + '.png',
                      width: _screenWidth / 9)),
              Tab(
                  icon: Image.asset(
                      'assets/' + baseItems[7].toLowerCase() + '.png',
                      width: _screenWidth / 9)),
              Tab(
                  icon: Image.asset(
                      'assets/' + baseItems[8].toLowerCase() + '.png',
                      width: _screenWidth / 9)),
            ],
            controller: controller,
          ),
          Container(
              width: _screenWidth,
              height: 500,
              child: TabBarView(
                children: <Widget>[
                  SparringGloves(),
                  BFSword(),
                  NLRod(),
                  RBow(),
                  TOGod(),
                  CV(),
                  NCloak(),
                  GBelt(),
                  Spatula(),
                  
                ],
                controller: controller,
              ))
        ]));
  }
}

