import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proj/data/champList.dart';
import 'dart:convert';
import 'champion.dart';
import 'data/urls.dart';

class BFSword extends StatelessWidget {
  Future<ItemData> fetchPost(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return ItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  Future<FinalItemData> fetchPost2(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return FinalItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: fetchPost('bfsword'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Row(children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/bfsword.png'),
                        Text(snapshot.data.name)
                      ]),
                  Card(
                      child: Text(snapshot.data.stats['amount'] +
                          " " +
                          snapshot.data.stats['title']))
                ]),
                Expanded(
                    // width: MediaQuery.of(context).size.width*0.45,
                    child: ListView.builder(
                  itemCount: snapshot.data.buildsInto.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: <Widget>[
                        Text(' + '),
                        Image.asset('assets/' +
                            baseItems
                            
                          [index].toLowerCase() +
                            '.png'),
                        Text(' = '),
                        Image.asset('assets/' +
                            snapshot.data.buildsInto[index].toString() +
                            '.png'),
                        Card(
                          child: FutureBuilder(
                            future: fetchPost2(
                                snapshot.data.buildsInto[index].toString()),
                            builder: (context, snap2) {
                              if (snap2.hasData) {
                                return SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    child: Text(snap2.data.bonus));
                              } else if (snap2.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return Container(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                      child: CircularProgressIndicator()));
                            },
                          ),
                        )
                      ],
                    );
                  },
                )),
              ]));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
            height: 100,
            width: 100,
            child: Center(child: CircularProgressIndicator()));
      },
    ));
  }
}

class NLRod extends StatelessWidget {
  Future<ItemData> fetchPost(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return ItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  Future<FinalItemData> fetchPost2(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return FinalItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: fetchPost('needlesslylargerod'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return //Text(snapshot.data.stats['name']);
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                Row(children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/' + snapshot.data.key + '.png'),
                        SizedBox(width: 64, child: Text(snapshot.data.name))
                      ]),
                  Card(
                      child: Text(snapshot.data.stats['amount'] +
                          " " +
                          snapshot.data.stats['title']))
                ]),
                Expanded(
                    child: ListView.builder(
                  itemCount: snapshot.data.buildsInto.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: <Widget>[
                        Text(' + '),
                        Image.asset('assets/' +
                            baseItems[index].toLowerCase() +
                            '.png'),
                        Text(' = '),
                        Image.asset('assets/' +
                            snapshot.data.buildsInto[index].toString() +
                            '.png'),
                        Card(
                          child: FutureBuilder(
                            future: fetchPost2(
                                snapshot.data.buildsInto[index].toString()),
                            builder: (context, snap2) {
                              if (snap2.hasData) {
                                return SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    child: Text(snap2.data.bonus));
                              } else if (snap2.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return Container(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                      child: CircularProgressIndicator()));
                            },
                          ),
                        )
                      ],
                    );
                  },
                ))
              ]));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
            height: 100,
            width: 100,
            child: Center(child: CircularProgressIndicator()));
      },
    ));
  }
}

class RBow extends StatelessWidget {
  Future<ItemData> fetchPost(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return ItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  Future<FinalItemData> fetchPost2(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return FinalItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: fetchPost('recurvebow'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return //Text(snapshot.data.stats['name']);
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                Row(children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/' + snapshot.data.key + '.png'),
                        SizedBox(width: 64, child: Text(snapshot.data.name))
                      ]),
                  Card(
                      child: Text(snapshot.data.stats['amount'] +
                          " " +
                          snapshot.data.stats['title']))
                ]),
                Expanded(
                    child: ListView.builder(
                  itemCount: snapshot.data.buildsInto.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: <Widget>[
                        Text(' + '),
                        Image.asset('assets/' +
                            baseItems[index].toLowerCase() +
                            '.png'),
                        Text(' = '),
                        Image.asset('assets/' +
                            snapshot.data.buildsInto[index].toString() +
                            '.png'),
                        Card(
                          child: FutureBuilder(
                            future: fetchPost2(
                                snapshot.data.buildsInto[index].toString()),
                            builder: (context, snap2) {
                              if (snap2.hasData) {
                                return SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    child: Text(snap2.data.bonus));
                              } else if (snap2.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return Container(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                      child: CircularProgressIndicator()));
                            },
                          ),
                        )
                      ],
                    );
                  },
                ))
              ]));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
            height: 100,
            width: 100,
            child: Center(child: CircularProgressIndicator()));
      },
    ));
  }
}

class TOGod extends StatelessWidget {
  Future<ItemData> fetchPost(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return ItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  Future<FinalItemData> fetchPost2(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return FinalItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: fetchPost('tearofthegoddess'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return //Text(snapshot.data.stats['name']);
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                Row(children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/' + snapshot.data.key + '.png'),
                        SizedBox(width: 64, child: Text(snapshot.data.name))
                      ]),
                  Card(
                      child: Text(snapshot.data.stats['amount'] +
                          " " +
                          snapshot.data.stats['title']))
                ]),
                Expanded(
                    child: ListView.builder(
                  itemCount: snapshot.data.buildsInto.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: <Widget>[
                        Text(' + '),
                        Image.asset('assets/' +
                            baseItems[index].toLowerCase() +
                            '.png'),
                        Text(' = '),
                        Image.asset('assets/' +
                            snapshot.data.buildsInto[index].toString() +
                            '.png'),
                        Card(
                          child: FutureBuilder(
                            future: fetchPost2(
                                snapshot.data.buildsInto[index].toString()),
                            builder: (context, snap2) {
                              if (snap2.hasData) {
                                return SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    child: Text(snap2.data.bonus));
                              } else if (snap2.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return Container(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                      child: CircularProgressIndicator()));
                            },
                          ),
                        )
                      ],
                    );
                  },
                ))
              ]));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
            height: 100,
            width: 100,
            child: Center(child: CircularProgressIndicator()));
      },
    ));
  }
}

class CV extends StatelessWidget {
  Future<ItemData> fetchPost(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return ItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  Future<FinalItemData> fetchPost2(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return FinalItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: fetchPost('chainvest'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return //Text(snapshot.data.stats['name']);
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                Row(children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/' + snapshot.data.key + '.png'),
                        SizedBox(width: 64, child: Text(snapshot.data.name))
                      ]),
                  Card(
                      child: Text(snapshot.data.stats['amount'] +
                          " " +
                          snapshot.data.stats['title']))
                ]),
                Expanded(
                    child: ListView.builder(
                  itemCount: snapshot.data.buildsInto.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: <Widget>[
                        Text(' + '),
                        Image.asset('assets/' +
                            baseItems[index].toLowerCase() +
                            '.png'),
                        Text(' = '),
                        Image.asset('assets/' +
                            snapshot.data.buildsInto[index].toString() +
                            '.png'),
                        Card(
                          child: FutureBuilder(
                            future: fetchPost2(
                                snapshot.data.buildsInto[index].toString()),
                            builder: (context, snap2) {
                              if (snap2.hasData) {
                                return SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    child: Text(snap2.data.bonus));
                              } else if (snap2.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return Container(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                      child: CircularProgressIndicator()));
                            },
                          ),
                        )
                      ],
                    );
                  },
                ))
              ]));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
            height: 100,
            width: 100,
            child: Center(child: CircularProgressIndicator()));
      },
    ));
  }
}

class NCloak extends StatelessWidget {
  Future<ItemData> fetchPost(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return ItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  Future<FinalItemData> fetchPost2(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return FinalItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: fetchPost('negatroncloak'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return //Text(snapshot.data.stats['name']);
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                Row(children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/' + snapshot.data.key + '.png'),
                        SizedBox(width: 64, child: Text(snapshot.data.name))
                      ]),
                  Card(
                      child: Text(snapshot.data.stats['amount'] +
                          " " +
                          snapshot.data.stats['title']))
                ]),
                Expanded(
                    child: ListView.builder(
                  itemCount: snapshot.data.buildsInto.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: <Widget>[
                        Text(' + '),
                        Image.asset('assets/' +
                            baseItems[index].toLowerCase() +
                            '.png'),
                        Text(' = '),
                        Image.asset('assets/' +
                            snapshot.data.buildsInto[index].toString() +
                            '.png'),
                        Card(
                          child: FutureBuilder(
                            future: fetchPost2(
                                snapshot.data.buildsInto[index].toString()),
                            builder: (context, snap2) {
                              if (snap2.hasData) {
                                return SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    child: Text(snap2.data.bonus));
                              } else if (snap2.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return Container(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                      child: CircularProgressIndicator()));
                            },
                          ),
                        )
                      ],
                    );
                  },
                ))
              ]));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
            height: 100,
            width: 100,
            child: Center(child: CircularProgressIndicator()));
      },
    ));
  }
}

class GBelt extends StatelessWidget {
  Future<ItemData> fetchPost(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return ItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  Future<FinalItemData> fetchPost2(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return FinalItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: fetchPost('giantsbelt'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return //Text(snapshot.data.stats['name']);
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                Row(children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/' + snapshot.data.key + '.png'),
                        SizedBox(width: 64, child: Text(snapshot.data.name))
                      ]),
                  Card(
                      child: Text(snapshot.data.stats['amount'] +
                          " " +
                          snapshot.data.stats['title']))
                ]),
                Expanded(
                    child: ListView.builder(
                  itemCount: snapshot.data.buildsInto.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: <Widget>[
                        Text(' + '),
                        Image.asset('assets/' +
                            baseItems[index].toLowerCase() +
                            '.png'),
                        Text(' = '),
                        Image.asset('assets/' +
                            snapshot.data.buildsInto[index].toString() +
                            '.png'),
                        Card(
                          child: FutureBuilder(
                            future: fetchPost2(
                                snapshot.data.buildsInto[index].toString()),
                            builder: (context, snap2) {
                              if (snap2.hasData) {
                                return SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    child: Text(snap2.data.bonus));
                              } else if (snap2.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return Container(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                      child: CircularProgressIndicator()));
                            },
                          ),
                        )
                      ],
                    );
                  },
                ))
              ]));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
            height: 100,
            width: 100,
            child: Center(child: CircularProgressIndicator()));
      },
    ));
  }
}

class Spatula extends StatelessWidget {
  Future<ItemData> fetchPost(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return ItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  Future<FinalItemData> fetchPost2(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return FinalItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: fetchPost('spatula'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return //Text(snapshot.data.stats['name']);
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                Row(children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/' + snapshot.data.key + '.png'),
                        SizedBox(width: 64, child: Text(snapshot.data.name))
                      ]),
                  Card(child: Text(snapshot.data.stats['title']))
                ]),
                Expanded(
                    child: ListView.builder(
                  itemCount: snapshot.data.buildsInto.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: <Widget>[
                        Text(' + '),
                        Image.asset('assets/' +
                            baseItems[index].toLowerCase() +
                            '.png'),
                        Text(' = '),
                        Image.asset('assets/' +
                            snapshot.data.buildsInto[index].toString() +
                            '.png'),
                        Card(
                          child: FutureBuilder(
                            future: fetchPost2(
                                snapshot.data.buildsInto[index].toString()),
                            builder: (context, snap2) {
                              if (snap2.hasData) {
                                return SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    child: Text(snap2.data.bonus));
                              } else if (snap2.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return Container(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                      child: CircularProgressIndicator()));
                            },
                          ),
                        )
                      ],
                    );
                  },
                ))
              ]));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
            height: 100,
            width: 100,
            child: Center(child: CircularProgressIndicator()));
      },
    ));
  }
}
class SparringGloves extends StatelessWidget {
  Future<ItemData> fetchPost(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return ItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  Future<FinalItemData> fetchPost2(String item) async {
    final response = await http.get(solomidItemsbase);

    if (response.statusCode == 200) {
      var a = json.decode(response.body);
      return FinalItemData.fromJson(a[item]);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: fetchPost('sparringgloves'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return //Text(snapshot.data.stats['name']);
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                Row(children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/' + snapshot.data.key + '.png'),
                        SizedBox(width: 64, child: Text(snapshot.data.name))
                      ]),
                  Card(
                      child: Text(snapshot.data.stats['amount'] +
                          " " +
                          snapshot.data.stats['title']))
                ]),
                Expanded(
                    child: ListView.builder(
                  itemCount: snapshot.data.buildsInto.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: <Widget>[
                        Text(' + '),
                        Image.asset('assets/' +
                            baseItems[index].toLowerCase() +
                            '.png'),
                        Text(' = '),
                        Image.asset('assets/' +
                            snapshot.data.buildsInto[index].toString() +
                            '.png'),
                        Card(
                          child: FutureBuilder(
                            future: fetchPost2(
                                snapshot.data.buildsInto[index].toString()),
                            builder: (context, snap2) {
                              if (snap2.hasData) {
                                return SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    child: Text(snap2.data.bonus));
                              } else if (snap2.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return Container(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                      child: CircularProgressIndicator()));
                            },
                          ),
                        )
                      ],
                    );
                  },
                ))
              ]));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
            height: 100,
            width: 100,
            child: Center(child: CircularProgressIndicator()));
      },
    ));
  }
}
