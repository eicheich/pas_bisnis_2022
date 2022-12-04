import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:pas_bisnis_2022/shared/Share.dart';
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/view/DetailPurchase.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:pas_bisnis_2022/view/Transaction.dart';

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
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left: 5),
          child: Text(
            'History',
            style: SharedCode()
                .textStyle("Lexend", 20, Color(0xFF1B1B1B), FontWeight.w400),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 24),
        child: ListView.builder(
          // reverse: true,
          itemCount: historydata.reversed.length,
          itemBuilder: (context, index) {
            int itemCount = historydata.length;
            int reversedIndex = itemCount - 1 - index;
            return InkWell(
              onLongPress: (() {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Delete Item"),
                      content: Text(
                          "Are you sure to delete ${historydata[reversedIndex].title}?"),
                      titleTextStyle: SharedCode().textStyle(
                          "Lexend", 16, Color(0xFF1B1B1B), FontWeight.w500),
                      contentTextStyle: SharedCode().textStyle(
                          "Lexend", 14, Color(0xFF1B1B1B), FontWeight.w400),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: SharedCode().textStyle("Lexend", 14,
                                Color(0xFF1B1B1B), FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            delete(historydata[reversedIndex].id).then((value) {
                              getHistory().then((value) {
                                setState(() {
                                  historydata = value;
                                });
                              });
                            });
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Yes",
                            style: SharedCode().textStyle("Lexend", 14,
                                Color(0xFF1B1B1B), FontWeight.w400),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPurchase(
                            data: historydata[reversedIndex],
                          )),
                ).then((value) => initDb());
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            historydata[reversedIndex].img1!,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    historydata[reversedIndex].title!,
                                    style: SharedCode().textStyle("Lexend", 14,
                                        Color(0xFF1B1B1B), FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    historydata[reversedIndex].desc!,
                                    style: SharedCode().textStyle(
                                        "Lexend",
                                        13,
                                        Color(0xFF1B1B1B).withOpacity(0.7),
                                        FontWeight.w400),
                                    maxLines: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "x1",
                            style: SharedCode().textStyle("Lexend", 14,
                                Color(0xFF1B1B1B), FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(children: [
                        Text(
                          "Shipping",
                          style: SharedCode().textStyle(
                              "Lexend", 13, Color(0xFF1B1B1B), FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          int.parse(historydata[reversedIndex].price!) > 750000
                              ? "Free"
                              : "Rp. 20.000",
                          style: SharedCode().textStyle(
                              "Lexend", 13, Color(0xFF1B1B1B), FontWeight.w500),
                        ),
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Row(children: [
                        Text(
                          "Payment",
                          style: SharedCode().textStyle(
                              "Lexend", 13, Color(0xFF1B1B1B), FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          "Credit / Debit Card",
                          style: SharedCode().textStyle(
                              "Lexend", 13, Color(0xFF1B1B1B), FontWeight.w500),
                        ),
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Row(children: [
                        Text(
                          "Total",
                          style: SharedCode().textStyle(
                              "Lexend", 13, Color(0xFF1B1B1B), FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          int.parse(historydata[reversedIndex].price!) > 750000
                              ? historydata[reversedIndex].price!
                              : (int.parse(historydata[reversedIndex].price!) +
                                      20000)
                                  .toString(),
                          style: SharedCode().textStyle("Poppins", 14,
                              Color(0xFF1B1B1B), FontWeight.w600),
                        ),
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      height: 1,
                      color: Color(0xFF1B1B1B).withOpacity(0.6),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 16),
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                            color: Color(0xFF1B1B1B),
                            borderRadius: BorderRadius.circular(8)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    data: historydata[reversedIndex]),
                              ),
                            );
                          },
                          child: Text(
                            "Buy Again",
                            style: SharedCode().textStyle(
                                "Lexend", 12, Colors.white, FontWeight.w400),
                          ),
                        )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
