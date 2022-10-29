import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
// import 'package:pas_bisnis_2022/view/cart.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

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
      appBar: AppBar(
        title: Text(widget.data.title.toString()),
        actions: [
          IconButton(
              onPressed: () {
                addCart ? delete(widget.data) : insert(widget.data);
              },
              icon: addCart
                  ? Icon(
                      CupertinoIcons.cart,
                      color: Color.fromARGB(255, 12, 98, 178),
                    )
                  : Icon(
                      CupertinoIcons.cart,
                      color: Color.fromARGB(255, 62, 178, 12),
                    )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.data.title.toString()),
            Text(widget.data.price.toString()),
            Text(widget.data.desc.toString()),
            Text('rating : ' + widget.data.rating.toString()),
            Text(widget.data.brand.toString()),
            Image.network(widget.data.img1.toString()),
            Image.network(widget.data.img2.toString()),
            Image.network(widget.data.imgbrand.toString()),
          ],
        ),
      ),
    );
  }
}
