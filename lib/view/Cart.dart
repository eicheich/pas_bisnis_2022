import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:pas_bisnis_2022/shared/Share.dart';
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/view/Transaction.dart';
import 'package:readmore/readmore.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:math';

List<String> list = <String>['1', '2', '3', '4'];

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  var database;
  List<Data> cartdata = <Data>[];

  Future initDb() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'pdata_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE data(id TEXT, title TEXT, price TEXT , desc TEXT , rating TEXT , sold TEXT, img1 TEXT , img2 TEXT , imgbrand TEXT, brand TEXT)',
        );
      },
      version: 1,
    );
    getAddCart().then((value) {
      setState(() {
        cartdata = value;
      });
    });
  }

  Future<List<Data>> getAddCart() async {
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
    getAddCart().then((value) {
      setState(() {
        cartdata = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initDb();
  }

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bag',
          style: SharedCode()
              .textStyle("Lexend", 20, Colors.white, FontWeight.w400),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFF1B1B1B),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 24),
        child: ListView.builder(
          itemCount: cartdata.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            data: cartdata[index],
                          )),
                ).then((value) => initDb());
                ;
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: Container(
                  height: 200,
                  padding:
                      EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.network(
                                cartdata[index].img1!,
                                width: 115,
                                height: 115,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  Container(
                                    child: Image.asset(
                                      "assets/images/delivery.png",
                                      width: 24,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      (int.parse(cartdata[index].price!) >
                                              500000)
                                          ? "Free"
                                          : "Rp. 20.000",
                                      style: SharedCode().textStyle(
                                          "Poppins",
                                          14,
                                          Color(0xFF1B1B1B),
                                          FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 13),
                        color: Color(0xFF1B1B1B).withOpacity(0.8),
                        height: MediaQuery.of(context).size.height,
                        width: 0.8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 115,
                            width: 220,
                            margin: EdgeInsets.only(left: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    cartdata[index].title!,
                                    style: SharedCode().textStyle("Lexend", 14,
                                        Color(0xFF1B1B1B), FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: Text(
                                    cartdata[index].desc!,
                                    style: SharedCode().textStyle(
                                        "Lexend",
                                        13,
                                        Color(0xFF1B1B1B).withOpacity(0.7),
                                        FontWeight.w400),
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 220,
                            margin: EdgeInsets.only(left: 14),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    "Rp. ${cartdata[index].price!.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
                                    style: SharedCode().textStyle("Poppins", 14,
                                        Color(0xFF1B1B1B), FontWeight.w600),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.only(top: 16),
                                  width: 100,
                                  height: 31,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF1B1B1B),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => transaction(
                                                data: cartdata[index])),
                                      );
                                    },
                                    child: Text(
                                      'Check Out',
                                      style: SharedCode().textStyle("Lexend",
                                          12, Colors.white, FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
