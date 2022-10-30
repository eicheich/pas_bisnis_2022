import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:pas_bisnis_2022/services/Notification.dart';
import 'package:pas_bisnis_2022/view/History.dart';
import 'package:pas_bisnis_2022/view/Navigation.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

class purchased extends StatefulWidget {
  purchased({Key? key, required this.data}) : super(key: key);
  Data data;

  @override
  State<purchased> createState() => _purchasedState();
}

class _purchasedState extends State<purchased> {
  int ship = 45000;
  bool isPurchased = false;
  var database;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDb();
  }

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
    isPurchased = await read(widget.data.id);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchased'),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.greenAccent,
            child: Column(
              children: [
                const Text('gambar thx for purchasing '),
                Text('yeah'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: isPurchased
                ? null //jika sudah pernah membeli
                
                : () async {
                    await insert(widget.data);
                    setState(() {
                      isPurchased = true ;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Navigation()),
                    );
                  },
            child: Text("Back to Home"),
          ),
        ],
      )),
    );
  }
}
