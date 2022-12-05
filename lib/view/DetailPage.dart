import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:pas_bisnis_2022/view/Cart.dart';
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
  CarouselController controller = CarouselController();

  int _current = 0;
  // list image network

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
                      addCart
                          ? delete(widget.data)
                          : showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Add to cart"),
                                  content: Text("Are you sure to add to cart?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        insert(widget.data);
                                        Navigator.pop(context);
                                      },
                                      child: Text("Yes"),
                                    ),
                                  ],
                                );
                              });
                    },
                    child: addCart
                        ? Image.asset(
                            "assets/images/bagFill.png",
                            height: 26,
                            width: 26,
                          )
                        : Image.asset(
                            "assets/images/bagFill.png",
                            height: 26,
                            width: 26,
                          )),
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
                actions: [
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    child: IconButton(
                      icon: Image.asset(
                        "assets/images/shop.png",
                        color: Color(0xFF1B1B1B),
                        height: 26,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => cart()),
                        );
                      },
                    ),
                  ),
                ],
                backgroundColor: Colors.white,
                stretch: false,
                pinned: true,
                floating: false,
                expandedHeight: 400,
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
                  // carousel slider with on page change
                  background: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 43),
                        Container(
                          height: 357,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              enableInfiniteScroll: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              },
                            ),
                            items: [
                              Image.network(
                                widget.data.img1!,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Image.network(
                                widget.data.img2!,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: widget.data.img1 == null
                              ? []
                              : widget.data.img2 == null
                                  ? []
                                  : [
                                      Container(
                                        width: 6.0,
                                        height: 6.0,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _current == 0
                                              ? Color(0xFF1B1B1B)
                                              : Color(0xFFD8D8D8),
                                        ),
                                      ),
                                      Container(
                                        width: 6.0,
                                        height: 6.0,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _current == 1
                                              ? Color(0xFF1B1B1B)
                                              : Color(0xFFD8D8D8),
                                        ),
                                      ),
                                    ],
                        ),
                      ],
                    ),
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
                          "Rp. " +
                              widget.data.price!.replaceAllMapped(
                                  new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  (Match m) => '${m[1]}.'),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
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
                                "Free Shipping on orders above Rp. 750.000",
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
                                      priceFormatIdr(0),
                                    )
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
                                      priceFormatIdr(2),
                                    )
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
                                      priceFormatIdr(13))
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
                                      priceFormatIdr(7))
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
                                      priceFormatIdr(15))
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
                                      priceFormatIdr(3))
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
                                      priceFormatIdr(6))
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
                                      priceFormatIdr(9))
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
                                      priceFormatIdr(12))
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
                                      priceFormatIdr(16))
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

  String priceFormatIdr(int index) {
    return productModel!.data![index].price!.replaceAllMapped(
        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
  }
}
