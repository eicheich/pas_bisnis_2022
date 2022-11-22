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
import 'package:pas_bisnis_2022/shared/Share.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.data}) : super(key: key);
  Data data;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ProductModel? productModel;
  bool isloaded = true;

  void getAllListPL() async {
    setState(() {
      isloaded = false;
    });
    final res = await http.get(
      Uri.parse("https://api-shoestore.000webhostapp.com/data.php"),
    );
    print("status code " + res.statusCode.toString());
    productModel = ProductModel.fromJson(json.decode(res.body.toString()));
    print("team 0 : " + productModel!.data![0].brand.toString());
    setState(() {
      isloaded = true;
    });
  }

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
    getAllListPL();
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
    setState(() {
      addCart = true;
    });
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
        bottomSheet: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 24, right: 24),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Container(
                width: 69,
                height: 47.5,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 1.8,
                      color: Color(0xFF1B1B1B),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    addCart ? delete(widget.data) : insert(widget.data);
                  },
                  child: addCart
                      ? Image.asset(
                          "assets/images/bagFill.png",
                          height: 26,
                          width: 26,
                        )
                      : Image.asset(
                          "assets/images/bagOutline.png",
                          height: 26,
                          width: 26,
                        ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 16),
                  width: MediaQuery.of(context).size.width,
                  height: 47.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF1B1B1B),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
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
                      'Check Out',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: "Lexend",
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: SliverAppBar(
                backgroundColor: Colors.white,
                stretch: false,
                pinned: true,
                floating: false,
                expandedHeight: 377,
                elevation: 0,
                title: Text(
                  widget.data.title!,
                  style: SharedCode().textStyle(
                      "Lexend", 17.5, Color(0xFF1B1B1B), FontWeight.w500),
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    widget.data.img1!,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            )
          ],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 14),
                    child: Text(
                      widget.data.brand!,
                      style: SharedCode().textStyle(
                          "Lexend", 15, Color(0xFF1B1B1B), FontWeight.w400),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Text(
                      widget.data.title!,
                      style: SharedCode().textStyle(
                          "Lexend", 24, Color(0xFF1B1B1B), FontWeight.w500),
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
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1B1B1B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Divider(
                        color: Color(0xFF1B1B1B).withOpacity(0.3),
                        thickness: 1),
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
                        fontSize: 13,
                        color: Color(0xFF1B1B1B).withOpacity(0.9),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/delivery.png",
                        height: 28,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Text(
                              "Free Delivery on orders above Rp. 500.000",
                              style: SharedCode().textStyle("Lexend", 13,
                                  Color(0xFF1B1B1B), FontWeight.w600),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16, top: 3),
                            child: Text(
                              "Get the order fast to you",
                              style: SharedCode().textStyle("Lexend", 13,
                                  Color(0xFF1B1B1B), FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Divider(
                        color: Color(0xFF1B1B1B).withOpacity(0.3),
                        thickness: 1),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      "Similar Product",
                      style: SharedCode().textStyle(
                          "Lexend", 24, Color(0xFF1B1B1B), FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          data: productModel!.data![0])),
                                );
                              },
                              child: isloaded
                                  ? SharedCode().productUi(
                                      productModel!.data![0].img1.toString(),
                                      productModel!.data![0].title.toString(),
                                      productModel!.data![0].sold.toString(),
                                      productModel!.data![0].price.toString())
                                  : SharedCode().placeholder(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          data: productModel!.data![2])),
                                );
                              },
                              child: isloaded
                                  ? SharedCode().productUi(
                                      productModel!.data![2].img1.toString(),
                                      productModel!.data![2].title.toString(),
                                      productModel!.data![2].sold.toString(),
                                      productModel!.data![2].price.toString())
                                  : SharedCode().placeholder(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          data: productModel!.data![13])),
                                );
                              },
                              child: isloaded
                                  ? SharedCode().productUi(
                                      productModel!.data![13].img1.toString(),
                                      productModel!.data![13].title.toString(),
                                      productModel!.data![13].sold.toString(),
                                      productModel!.data![13].price.toString())
                                  : SharedCode().placeholder(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          data: productModel!.data![7])),
                                );
                              },
                              child: isloaded
                                  ? SharedCode().productUi(
                                      productModel!.data![7].img1.toString(),
                                      productModel!.data![7].title.toString(),
                                      productModel!.data![7].sold.toString(),
                                      productModel!.data![7].price.toString())
                                  : SharedCode().placeholder(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          data: productModel!.data![15])),
                                );
                              },
                              child: isloaded
                                  ? SharedCode().productUi(
                                      productModel!.data![15].img1.toString(),
                                      productModel!.data![15].title.toString(),
                                      productModel!.data![15].sold.toString(),
                                      productModel!.data![15].price.toString())
                                  : SharedCode().placeholder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      "Shoes of the Week",
                      style: SharedCode().textStyle(
                          "Lexend", 24, Color(0xFF1B1B1B), FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          data: productModel!.data![3])),
                                );
                              },
                              child: isloaded
                                  ? SharedCode().productUi(
                                      productModel!.data![3].img1.toString(),
                                      productModel!.data![3].title.toString(),
                                      productModel!.data![3].sold.toString(),
                                      productModel!.data![3].price.toString())
                                  : SharedCode().placeholder(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          data: productModel!.data![6])),
                                );
                              },
                              child: isloaded
                                  ? SharedCode().productUi(
                                      productModel!.data![6].img1.toString(),
                                      productModel!.data![6].title.toString(),
                                      productModel!.data![6].sold.toString(),
                                      productModel!.data![6].price.toString())
                                  : SharedCode().placeholder(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          data: productModel!.data![9])),
                                );
                              },
                              child: isloaded
                                  ? SharedCode().productUi(
                                      productModel!.data![9].img1.toString(),
                                      productModel!.data![9].title.toString(),
                                      productModel!.data![9].sold.toString(),
                                      productModel!.data![9].price.toString())
                                  : SharedCode().placeholder(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          data: productModel!.data![12])),
                                );
                              },
                              child: isloaded
                                  ? SharedCode().productUi(
                                      productModel!.data![12].img1.toString(),
                                      productModel!.data![12].title.toString(),
                                      productModel!.data![12].sold.toString(),
                                      productModel!.data![12].price.toString())
                                  : SharedCode().placeholder(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          data: productModel!.data![16])),
                                );
                              },
                              child: isloaded
                                  ? SharedCode().productUi(
                                      productModel!.data![16].img1.toString(),
                                      productModel!.data![16].title.toString(),
                                      productModel!.data![16].sold.toString(),
                                      productModel!.data![16].price.toString())
                                  : SharedCode().placeholder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
