import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/view/ListBrand.dart';
import 'package:pas_bisnis_2022/view/Cart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListPL();
  }

  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        backgroundColor: Color(0xFF1E5128),
        floating: true,
        pinned: true,
        snap: false,
        centerTitle: false,
        title: Container(
          margin: EdgeInsets.only(left: 1),
          height: 38,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 5),
              border: InputBorder.none,
              fillColor: Colors.white,
              filled: true,
              hintText: 'Search for something',
              prefixIcon: Icon(
                Icons.search,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => cart()),
              );
            },
          ),
        ],
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          Container(
              height: 450,
              child: Stack(children: <Widget>[
                Positioned.fill(
                    child: Container(
                        alignment: Alignment.center,
                        // width: 390,
                        height: 500,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/newin.png'),
                              fit: BoxFit.fitWidth),
                        ))),
                Positioned.fill(
                    top: 345,
                    child: Text(
                      'NEW IN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Lexend',
                          fontSize: 30,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                Positioned.fill(
                    top: 380,
                    child: Text(
                      'SHOP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Lexend',
                          fontSize: 20,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
              ])),
          SizedBox(
            height: 8,
          ),
          Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFF1E5128),
            ),
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  'TRY IT AND FREE RETURN',
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
              height: 260,
              child: Stack(children: <Widget>[
                Positioned.fill(
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/Disc.png'),
                              fit: BoxFit.fitWidth),
                        ))),
                Positioned.fill(
                    top: 180,
                    child: Text(
                      '   All 25% off \n   for new users',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          // make the font bold

                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Lexend',
                          fontSize: 22,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    )),
              ])),
        ]),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          Container(
              height: 96,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        top: 40,
                        child: Text(
                          '   Shop by Brand',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              // make the font bold

                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Lexend',
                              fontSize: 22,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        )),
                  ],
                ),
              ))
        ]),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(20),
        sliver: SliverGrid.count(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 3,
          children: <Widget>[
            InkWell(
              child: Container(
                child: isloaded == true
                    ? Image.network(productModel!.data![0].imgbrand.toString())
                    : Text(""),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => listbrand()));
              },
            ),
            InkWell(
              child: Container(
                child: isloaded == true
                    ? Image.network(productModel!.data![1].imgbrand.toString())
                    : Text(""),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => listbrand()));
              },
            ),
            InkWell(
              child: Container(
                child: isloaded == true
                    ? Image.network(productModel!.data![3].imgbrand.toString())
                    : Text(""),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => listbrand()));
              },
            ),
            InkWell(
              child: Container(
                child: isloaded == true
                    ? Image.network(productModel!.data![4].imgbrand.toString())
                    : Text(""),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => listbrand()));
              },
            ),
            InkWell(
              child: Container(
                child: isloaded == true
                    ? Image.network(productModel!.data![5].imgbrand.toString())
                    : Text(""),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => listbrand()));
              },
            ),
            InkWell(
              child: Container(
                child: isloaded == true
                    ? Image.network(productModel!.data![16].imgbrand.toString())
                    : Text(""),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => listbrand()));
              },
            ),
          ],
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          Container(
              height: 96,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        top: 40,
                        child: Text(
                          '   Trend For You',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              // make the font bold

                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Lexend',
                              fontSize: 22,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        )),
                  ],
                ),
              )),
        ]),
      ),
      SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverGrid.count(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 2,

              // Generate 100 widgets that display their index in the List.
              children: List.generate(17, (index) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 167,
                        child: isloaded == true
                            ? InkWell(
                                child: Card(
                                  child: Container(
                                    height: 167,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned.fill(
                                            top: -100,
                                            child: Image.network(
                                              productModel!.data![index].img1
                                                  .toString(),
                                              fit: BoxFit.fitWidth,
                                            )),
                                        Positioned.fill(
                                            top: 89,
                                            child: Text(
                                              '   ' +
                                                  productModel!
                                                      .data![index].title
                                                      .toString(),
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  // make the font bold

                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontFamily: 'Lexend',
                                                  fontSize: 12,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1),
                                            )),
                                        Positioned.fill(
                                          top: 96,
                                          child: Text(
                                            '\n    Rp.' +
                                                productModel!.data![index].price
                                                    .toString(),
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontFamily: 'Lexend',
                                                fontSize: 10,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1),
                                          ),
                                        ),
                                        Positioned.fill(
                                          top: 128,
                                          left: 25,
                                          child: Text(
                                              productModel!.data![index].rating
                                                  .toString(),
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color(0xFF909090),
                                                  fontFamily: 'Lexend',
                                                  fontSize: 10,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1)),
                                        ),
                                        Positioned.fill(
                                            top: 105,
                                            left: 10,
                                            child: Container(
                                                decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  scale: 2.5,
                                                  image: AssetImage(
                                                      'assets/images/star.png'),
                                                  fit: BoxFit.none),
                                            ))),
                                        Positioned.fill(
                                          top: 127,
                                          left: 35,
                                          child: Text('|',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color(0xFF909090),
                                                  fontFamily: 'Lexend',
                                                  fontSize: 10,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1)),
                                        ),
                                        Positioned.fill(
                                          top: 128,
                                          left: 40,
                                          child: Text(
                                              'Sold ' +
                                                  productModel!
                                                      .data![index].sold
                                                      .toString(),
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color(0xFF909090),
                                                  fontFamily: 'Lexend',
                                                  fontSize: 10,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                                data:
                                                    productModel!.data![index],
                                              )));
                                },
                              )
                            : Text(""),
                      ),
                    ],
                  ),
                );
              }))),
    ]));
  }
}
