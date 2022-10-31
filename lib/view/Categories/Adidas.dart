import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/view/Navigation.dart';

class adidas extends StatefulWidget {
  adidas({Key? key}) : super(key: key);

  @override
  State<adidas> createState() => _adidasState();
}

class _adidasState extends State<adidas> {
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
    return Scaffold(
        appBar: isloaded == true
            ? AppBar(
                backgroundColor: Color(0xFF1E5128),
                title: Text(
                  productModel!.data![4].brand.toString(),
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              )
            : AppBar(
                backgroundColor: Color(0xFF1E5128),
                title: Text(
                  "Loading",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
        body: Center(
          child: Column(
            children: [
              InkWell(
                child: Card(
                    margin: EdgeInsets.all(10),
                    child: isloaded == true
                        ? Container(
                            margin:
                                EdgeInsets.only(right: 10, left: 10, top: 10),
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 70,
                                    height: 70,
                                    child: Image.network(productModel!
                                        .data![4].img1
                                        .toString())),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productModel!.data![4].title.toString(),
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Rp. ' +
                                          productModel!.data![4].price
                                              .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Sold ' +
                                          productModel!.data![4].sold
                                              .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 10,
                                          color: Color(0xFF909090),
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                                SizedBox(
                                  width: 73,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF1E5128),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            width: 363,
                            height: 78,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 363,
                                      height: 78,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 4),
                                              blurRadius: 4)
                                        ],
                                        color: Color.fromRGBO(206, 206, 206, 1),
                                      ))),
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 87,
                                      height: 78,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(136, 136, 136, 1),
                                      ))),
                              Positioned(
                                  top: 27,
                                  left: 347,
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  )),
                              Positioned(
                                  top: 8,
                                  left: 105,
                                  child: Container(
                                      width: 169,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(136, 136, 136, 1),
                                      ))),
                              Positioned(
                                  top: 32,
                                  left: 105,
                                  child: Container(
                                      width: 97,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(153, 152, 152, 1),
                                      ))),
                              Positioned(
                                  top: 52,
                                  left: 105,
                                  child: Container(
                                      width: 56,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(181, 181, 181, 1),
                                      ))),
                            ]))),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(data: productModel!.data![4])),
                  );
                },
              ),
              InkWell(
                child: Card(
                    margin: EdgeInsets.only(
                      right: 10,
                      left: 10,
                    ),
                    child: isloaded == true
                        ? Container(
                            margin: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 70,
                                    height: 70,
                                    child: Image.network(productModel!
                                        .data![12].img1
                                        .toString())),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productModel!.data![12].title.toString(),
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Rp. ' +
                                          productModel!.data![12].price
                                              .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Sold ' +
                                          productModel!.data![12].sold
                                              .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 10,
                                          color: Color(0xFF909090),
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 52,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF1E5128),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            width: 363,
                            height: 78,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 363,
                                      height: 78,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 4),
                                              blurRadius: 4)
                                        ],
                                        color: Color.fromRGBO(206, 206, 206, 1),
                                      ))),
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 87,
                                      height: 78,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(136, 136, 136, 1),
                                      ))),
                              Positioned(
                                  top: 27,
                                  left: 347,
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  )),
                              Positioned(
                                  top: 8,
                                  left: 105,
                                  child: Container(
                                      width: 169,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(136, 136, 136, 1),
                                      ))),
                              Positioned(
                                  top: 32,
                                  left: 105,
                                  child: Container(
                                      width: 97,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(153, 152, 152, 1),
                                      ))),
                              Positioned(
                                  top: 52,
                                  left: 105,
                                  child: Container(
                                      width: 56,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(181, 181, 181, 1),
                                      ))),
                            ]))),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(data: productModel!.data![12])),
                  );
                },
              ),
              InkWell(
                child: Card(
                    margin: EdgeInsets.only(
                      top: 10,
                      right: 10,
                      left: 10,
                    ),
                    child: isloaded == true
                        ? Container(
                            margin: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 70,
                                    height: 70,
                                    child: Image.network(productModel!
                                        .data![14].img1
                                        .toString())),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productModel!.data![14].title.toString(),
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Rp. ' +
                                          productModel!.data![14].price
                                              .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Sold ' +
                                          productModel!.data![14].sold
                                              .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 10,
                                          color: Color(0xFF909090),
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 71,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF1E5128),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            width: 363,
                            height: 78,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 363,
                                      height: 78,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 4),
                                              blurRadius: 4)
                                        ],
                                        color: Color.fromRGBO(206, 206, 206, 1),
                                      ))),
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 87,
                                      height: 78,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(136, 136, 136, 1),
                                      ))),
                              Positioned(
                                  top: 27,
                                  left: 347,
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  )),
                              Positioned(
                                  top: 8,
                                  left: 105,
                                  child: Container(
                                      width: 169,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(136, 136, 136, 1),
                                      ))),
                              Positioned(
                                  top: 32,
                                  left: 105,
                                  child: Container(
                                      width: 97,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(153, 152, 152, 1),
                                      ))),
                              Positioned(
                                  top: 52,
                                  left: 105,
                                  child: Container(
                                      width: 56,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(181, 181, 181, 1),
                                      ))),
                            ]))),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(data: productModel!.data![14])),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
