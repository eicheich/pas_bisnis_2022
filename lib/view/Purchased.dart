import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:pas_bisnis_2022/services/Notification.dart';
import 'package:pas_bisnis_2022/shared/Share.dart';
import 'package:pas_bisnis_2022/view/History.dart';
import 'package:pas_bisnis_2022/view/Home.dart';
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/PurchasedBackground.png"),
              fit: BoxFit.fill),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 136),
                child: CircleAvatar(
                  backgroundColor: Color(0xFF1B1B1B).withOpacity(0.6),
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF1B1B1B).withOpacity(0.8),
                    radius: 65,
                    child: Image.asset(
                      "assets/images/check.png",
                      width: 100,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              Text(
                "Payment Success",
                style: SharedCode()
                    .textStyle("Lexend", 32, Colors.white, FontWeight.w500),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Your payment was successful!",
                style: SharedCode()
                    .textStyle("Lexend", 15, Colors.white, FontWeight.w400),
              ),
              Text(
                "Just wait Ufee courier arrives at home",
                style: SharedCode()
                    .textStyle("Lexend", 15, Colors.white, FontWeight.w400),
              ),
              SizedBox(
                height: 112,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 4, top: 4),
                    alignment: Alignment.center,
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                      color: Colors.transparent,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Navigation(),
                        ),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 17, horizontal: 24),
                      alignment: Alignment.center,
                      height: 60,
                      width: 190,
                      color: Colors.white,
                      child: Text(
                        "Back to Home",
                        style: TextStyle(
                          color: Color(0xFF1B1B1B),
                          fontFamily: 'Lexend',
                          fontSize: 18.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
