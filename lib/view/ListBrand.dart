import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:http/http.dart' as http;

class listbrand extends StatefulWidget {
  listbrand({Key? key, required this.data}) : super(key: key);
  Data data;

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
        // backgroundColor: Color.fromARGB(255, 234, 234, 234),
        // body: Center(
        //   child: Card(
        //     child: isloaded == true
        //         ? ListView(
        //             children: [
        //               Container(
        //                 height: 100,
        //                 width: 100,
        //                 child: Image.network(
        //                   widget.data.img1.toString(),
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),
        //               Text(widget.data.brand.toString()),
        //               Text(widget.data.title.toString()),
        //               Text(widget.data.price.toString()),
        //               Text(widget.data.desc.toString()),
        //             ],
        //           )
        //         : CircularProgressIndicator(),
        //   ),
        // )
        );
  }
}
