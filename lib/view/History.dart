import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/view/DetailPurchase.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  var database;
  List<Data> historydata = <Data>[];

  Future initDb() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'history_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE data(id TEXT, title TEXT, price TEXT , desc TEXT , rating TEXT , sold TEXT, img1 TEXT , img2 TEXT , imgbrand TEXT, brand TEXT)',
        );
      },
      version: 1,
    );
    getHistory().then((value) {
      setState(() {
        historydata = value;
      });
    });
  }

  Future<List<Data>> getHistory() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('data');
    return List.generate(maps.length, (i) {
      return Data(
        id: maps[i]['id'],
        title: maps[i]['title'],
        price: maps[i]['price'],
        brand: maps[i]['brand'],
        desc: maps[i]['desc'],
        rating: maps[i]['rating'],
        sold: maps[i]['sold'],
        img1: maps[i]['img1'],
        img2: maps[i]['img2'],
        imgbrand: maps[i]['imgbrand'],
      );
    });
  }

  Future<void> delete(String? id) async {
    final db = await database;
    await db.delete(
      'data',
      where: "id = ?",
      whereArgs: [id],
    );
    getHistory().then((value) {
      setState(() {
        historydata = value;
      });
    });
  }

  @override
  void initState() {
    initDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase History'),
      ),
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPurchase(
                          data: historydata[index],
                        )),
              ).then((value) => initDb());
              ;
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.white,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 40,
                              height: 40,
                              child: FadeInImage.assetNetwork(
                                placeholder: " ",
                                image: historydata[index].img1.toString(),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      historydata[index].title.toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Text(
                                    historydata[index].price.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ]),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 80),
                            child: InkWell(
                              onTap: () {
                                delete(historydata[index].id).then((value) {
                                  getHistory().then((value) {
                                    setState(() {
                                      historydata = value;
                                    });
                                  });
                                });
                              },
                              child: Icon(
                                CupertinoIcons.delete_simple,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: historydata.length,
      ),
    );
  }
}
