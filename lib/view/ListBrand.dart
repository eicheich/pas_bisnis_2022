import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:http/http.dart' as http;

class listbrand extends StatefulWidget {
  listbrand({Key? key}) : super(key: key);

  @override
  State<listbrand> createState() => _listbrandState();
}

class _listbrandState extends State<listbrand> {
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
            ? AppBar(title: Text(productModel!.data![0].brand.toString()))
            : AppBar(title: Text("Loading")),
        body: Center(
          child: Column(
            children: [
              InkWell(
                child: Card(
                  child: isloaded == true
                      ? Container(
                          margin: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  width: 40,
                                  height: 40,
                                  child: Image.network(
                                      productModel!.data![0].img1.toString())),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productModel!.data![0].title.toString()),
                                  Text(productModel!.data![0].price.toString()),
                                ],
                              )
                            ],
                          ),
                        )
                      : Text(""),
                ),
              ),
              InkWell(
                child: Card(
                  child: isloaded == true
                      ? Container(
                          margin: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  width: 40,
                                  height: 40,
                                  child: Image.network(
                                      productModel!.data![0].img1.toString())),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productModel!.data![0].title.toString()),
                                  Text(productModel!.data![0].price.toString()),
                                ],
                              )
                            ],
                          ),
                        )
                      : Text(""),
                ),
              ),
            ],
          ),
        ));
  }
}
