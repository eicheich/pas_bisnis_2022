import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/view/Navigation.dart';

import '../../shared/Share.dart';

class nike extends StatefulWidget {
  nike({Key? key}) : super(key: key);

  @override
  State<nike> createState() => _nikeState();
}

class _nikeState extends State<nike> {
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
                productModel!.data![7].brand.toString(),
                style: TextStyle(
                  fontFamily: 'Lexend',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            body: Container(
              margin: EdgeInsets.only(top: 18, bottom: 30, left: 30, right: 30),
              child: Column(
                children: [
                  Row(children: [
                    InkWell(
                      child: SharedCode().productUi(
                        productModel!.data![5].img1!,
                        productModel!.data![5].title!,
                        productModel!.data![5].sold!,
                        productModel!.data![5].price!.replaceAllMapped(
                            new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]}.'),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(data: productModel!.data![5])),
                        );
                      },
                    ),
                    Spacer(),
                    InkWell(
                      child: SharedCode().productUi(
                        productModel!.data![6].img1!,
                        productModel!.data![6].title!,
                        productModel!.data![6].sold!,
                        productModel!.data![6].price!.replaceAllMapped(
                            new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]}.'),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(data: productModel!.data![6])),
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
                          productModel!.data![7].img1!,
                          productModel!.data![7].title!,
                          productModel!.data![7].sold!,
                          productModel!.data![7].price!.replaceAllMapped(
                              new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (Match m) => '${m[1]}.'),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(data: productModel!.data![7])),
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
