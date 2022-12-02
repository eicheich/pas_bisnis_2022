import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:pas_bisnis_2022/shared/Share.dart';
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/view/Navigation.dart';

class converse extends StatefulWidget {
  converse({Key? key}) : super(key: key);

  @override
  State<converse> createState() => _converseState();
}

class _converseState extends State<converse> {
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

  @override
  Widget build(BuildContext context) {
    return isloaded
        ? Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Color(0xFF1B1B1B),
              title: Text(
                productModel!.data![0].brand.toString(),
                style: SharedCode()
              .textStyle("Lexend", 20, Colors.white, FontWeight.w400),
              ),
            ),
            body: Container(
              margin: EdgeInsets.only(top: 18, bottom: 30, left: 30, right: 30),
              child: Column(
                children: [
                  Row(children: [
                    InkWell(
                      child: SharedCode().productUi(
                        productModel!.data![0].img1!,
                        productModel!.data![0].title!,
                        productModel!.data![0].sold!,
                        productModel!.data![0].price!.replaceAllMapped(
                            new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]}.'),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(data: productModel!.data![0])),
                        );
                      },
                    ),
                    Spacer(),
                    InkWell(
                      child: SharedCode().productUi(
                        productModel!.data![2].img1!,
                        productModel!.data![2].title!,
                        productModel!.data![2].sold!,
                        productModel!.data![2].price!.replaceAllMapped(
                            new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]}.'),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(data: productModel!.data![2])),
                        );
                      },
                    ),
                  ]),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: SharedCode().productUi(
                          productModel!.data![9].img1!,
                          productModel!.data![9].title!,
                          productModel!.data![9].sold!,
                          productModel!.data![9].price!.replaceAllMapped(
                              new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (Match m) => '${m[1]}.'),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(data: productModel!.data![9])),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ))
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Color(0xFF1B1B1B),
              title: Text(
                "Loading",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
