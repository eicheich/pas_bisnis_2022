import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:pas_bisnis_2022/shared/Share.dart';
import 'package:pas_bisnis_2022/view/Categories/Adidas.dart';
import 'package:pas_bisnis_2022/view/Categories/Converse.dart';
import 'package:http/http.dart' as http;
import 'package:pas_bisnis_2022/view/Categories/NewBalane.dart';
import 'dart:convert';
import 'package:pas_bisnis_2022/view/Categories/Nike.dart';
import 'package:pas_bisnis_2022/view/Categories/Puma.dart';
import 'package:pas_bisnis_2022/view/Categories/Reebok.dart';
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

class AllCategory extends StatefulWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  ProductModel? productModel;
  bool isloaded = false;

  void getAllListPL() async {
    final res = await http.get(
      Uri.parse("https://api-shoestore.000webhostapp.com/data.php"),
    );
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      setState(() {
        productModel = ProductModel.fromJson(data);
        isloaded = true;
      });
    } else {
      throw Exception("Failed to load data");
    }
  }
  // void getAllListPL() async {
  //   final response = await http.get(
  //     Uri.parse("https://api-shoestore.000webhostapp.com/data.php"),
  //   );
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     productModel = ProductModel.fromJson(json.decode(data.body.toString()));
  //     setState(() {
  //       productModel = ProductModel.fromJson(data);
  //       isloaded = true;
  //     });
  //   } else {
  //     throw Exception("Failed to load data");
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListPL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  // make carousel fullscreen
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 585,
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        enlargeCenterPage: false,
                        scrollPhysics: NeverScrollableScrollPhysics()),
                    items: [
                      //1st Image of Slider
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/newin.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //2nd Image of Slider
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/img2.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //3rd Image of Slider
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/img3.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //4th Image of Slider
                    ],
                  ),

                  // Image.asset("assets/images/newin.png"),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 478),
                    child: Text(
                      "NEW IN",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.w400,
                          letterSpacing: 3,
                          fontSize: 34),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 523),
                    child: Text(
                      "SHOP",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                          fontSize: 18,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 8),
                color: Color(0xFF1B1B1B),
                height: 45,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Try it and free returns".toUpperCase(),
                    style: TextStyle(
                        fontFamily: 'Lexend',
                        color: Colors.white,
                        fontSize: 17),
                  ),
                ),
              ),
              Stack(
                children: [
                  Image.asset("assets/images/Disc.png"),
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(top: 195, left: 24),
                    child: Text(
                      "All 25% off",
                      style: TextStyle(
                          color: Color(0xFF1B1B1B),
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.4,
                          fontSize: 28),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(top: 230, left: 24),
                    child: Text(
                      "for new users",
                      style: TextStyle(
                          color: Color(0xFF1B1B1B),
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.4,
                          fontSize: 28),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 60, left: 24),
                child: Text(
                  "Shop by Brand",
                  style: TextStyle(
                      color: Color(0xFF1B1B1B),
                      fontFamily: "Lexend",
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 228,
                width: 342,
                margin: EdgeInsets.only(left: 24, right: 24, top: 30),
                child: Stack(
                  children: [
                    Container(
                      child: Stack(children: [
                        Positioned(
                            child: Container(
                          child: InkWell(
                            child: Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 27, left: 27),
                              child: Image.asset(
                                "assets/images/Adidas.png",
                                height: 60,
                                width: 60,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => adidas()));
                            },
                          ),
                        )),
                        Positioned(
                          child: Container(
                              alignment: Alignment.topCenter,
                              child: InkWell(
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  margin: EdgeInsets.only(
                                    top: 27,
                                  ),
                                  child: Image.asset(
                                    "assets/images/Converse.png",
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => converse()));
                                },
                              )),
                        ),
                        Positioned(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              child: Container(
                                height: 60,
                                width: 60,
                                margin: EdgeInsets.only(top: 27, right: 27),
                                child: Image.asset(
                                  "assets/images/Nike.png",
                                  height: 60,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => nike()));
                              },
                            ),
                          ),
                        ),
                        Positioned(
                            child: Container(
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 27, left: 27),
                              child: Image.asset(
                                "assets/images/NB.png",
                                height: 60,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => newbalance()));
                            },
                          ),
                        )),
                        Positioned(
                            child: Container(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            child: Container(
                                margin: EdgeInsets.only(bottom: 27),
                                child: Image.asset(
                                  "assets/images/Puma.png",
                                  height: 60,
                                )),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => puma()));
                            },
                          ),
                        )),
                        Positioned(
                            child: Container(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 27, right: 27),
                              child: Image.asset(
                                "assets/images/Reebok.png",
                                height: 60,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => reebok()));
                            },
                          ),
                        ))
                      ]),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 228,
                      width: 1,
                      margin: EdgeInsets.only(left: 114),
                      color: Color(0xFF000000).withOpacity(0.2),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 114),
                      child: Container(
                        height: 228,
                        width: 1,
                        color: Color(0xFF000000).withOpacity(0.2),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(),
                      child: Container(
                        height: 1,
                        width: 342,
                        color: Color(0xFF000000).withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 24, top: 60, bottom: 30),
                child: Text(
                  "For You",
                  style: TextStyle(
                      fontFamily: "Lexend",
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: isloaded
                    ? GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 17,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 20,
                          // childAspectRatio: 0.5,
                          mainAxisExtent: 238,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                            data: productModel!.data![index],
                                          )));
                            },
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Image.network(
                                      productModel!.data![index].img1!,
                                      height: 159,
                                      width: double.infinity,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      productModel!.data![index].title!,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "Lexend",
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Sold " +
                                          productModel!.data![index].sold!,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color:
                                            Color(0xFF1B1B1B).withOpacity(0.6),
                                        fontSize: 12,
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Rp. ${productModel!.data![index].price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        height: 1,
                                        color: Color(0xFF1B1B1B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 17,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 13,
                          mainAxisExtent: 251,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                              data: productModel!.data![index],
                                            )));
                              },
                              child: SharedCode().placeholder());
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
