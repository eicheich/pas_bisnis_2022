import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:pas_bisnis_2022/view/transaction.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.data}) : super(key: key);
  Data data;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool addCart = false;
  var database;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDb();
  }

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
    addCart = await read(widget.data.id);
    setState(() {});
  }

  Future<void> insert(Data data) async {
    final Database db = await database;
    await db.insert(
      'data',
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> read(String? id) async {
    final Database db = await database;
    final pdata = await db.query('data', where: "id = ?", whereArgs: [id]);
    if (pdata.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> delete(Data? data) async {
    final db = await database;
    await db.delete(
      'data',
      where: "id = ?",
      whereArgs: [data!.id],
    );
    setState(() {
      addCart = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Image.network(widget.data.img1!),
                    Positioned(
                      left: 18,
                      top: 51,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          CupertinoIcons.chevron_back,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 14),
                      child: Text(
                        widget.data.brand!,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Lexend",
                            fontSize: 15),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.data.title!,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Lexend",
                            fontSize: 26.5,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 23),
                                  child: Icon(
                                    CupertinoIcons.star_fill,
                                    color: Color(0xFFFFA800),
                                    size: 16,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 23, left: 7),
                                  child: Text(
                                    widget.data.rating!,
                                    style: TextStyle(
                                        fontFamily: "Lexend", fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 9),
                              child: Text(
                                "Sold " + widget.data.sold!,
                                style: TextStyle(
                                  fontFamily: "Lexend",
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(top: 47),
                          child: Text(
                            "Rp. " + widget.data.price!,
                            style: TextStyle(
                              fontFamily: "Lexend",
                              fontSize: 20,
                              color: Color(0xFF1E5128),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Divider(
                          color: Colors.black.withOpacity(0.3), thickness: 1),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      child: ReadMoreText(
                        widget.data.desc!,
                        trimLines: 5,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: "Read more",
                        moreStyle: TextStyle(
                            decoration: TextDecoration.underline, fontSize: 14),
                        lessStyle: TextStyle(
                            decoration: TextDecoration.underline, fontSize: 14),
                        delimiter: " ...",
                        trimExpandedText: "\n\nRead less",
                        style: TextStyle(
                          fontFamily: "Lexend",
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.9),
                        ),
                      ),
                    ),
                    // button
                    Container(
                      width: double.infinity,
                      height: 60,
                      margin: EdgeInsets.only(top: 57),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Color(0xFF1E5128),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          addCart ? delete(widget.data) : insert(widget.data);
                        },
                        child: addCart
                            ? Text(
                                "Added to Bag",
                                style: TextStyle(
                                    color: Color(0xFF1E5128),
                                    fontFamily: "Lexend",
                                    fontSize: 20),
                              )
                            : Text(
                                "Add to Bag",
                                style: TextStyle(
                                    color: Color(0xFF1E5128),
                                    fontFamily: "Lexend",
                                    fontSize: 20),
                              ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      margin: EdgeInsets.only(top: 14),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF1E5128),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    transaction(data: widget.data)),
                          );
                        },
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontFamily: "Lexend",
                              fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//               Text(widget.data.title.toString()),
//               Text(widget.data.price.toString()),
//               Text(widget.data.desc.toString()),
//               Text('rating : ' + widget.data.rating.toString()),
//               Text(widget.data.brand.toString()),
//               Image.network(widget.data.img1.toString()),
//               Image.network(widget.data.img2.toString()),
//               Image.network(widget.data.imgbrand.toString()),
