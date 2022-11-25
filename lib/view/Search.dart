import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  ProductModel? productModel;
  bool isloaded = true;
  late final ValueChanged<String> onChanged;

  void getAllListPL() async {
    setState(() {
      isloaded = false;
    });
    final res = await http.get(
      Uri.parse("https://api-shoestore.000webhostapp.com/data.php"),
    );
    print("status code " + res.statusCode.toString());
    productModel = ProductModel.fromJson(json.decode(res.body.toString()));
    print("team 0 : " + productModel!.data![7].brand.toString());
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

  // void search for API list
  void search(String text) async {
    if (text.isEmpty) {
      getAllListPL();
      return;
    }
    productModel!.data!.retainWhere((element) {
      var name = element.title!.toLowerCase();
      var search = text.toLowerCase();
      return name.contains(search);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Container(
          width: 240,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Find Products...",
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            ),
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              search(value);
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: isloaded
                ? ListView.builder(
                    itemCount: productModel!.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.only(right: 20, left: 20, top: 10),
                        shadowColor: Colors.black.withOpacity(0.5),
                        elevation: 3,
                        child: Row(
                          children: [
                            Container(
                              width: 87,
                              height: 78,
                              child: Image.network(
                                productModel!.data![index].img1.toString(),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productModel!.data![index].title.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Rp. ' +
                                      productModel!.data![index].price!
                                          // formatter to IDR
                                          .toString()
                                          .replaceAllMapped(
                                              new RegExp(
                                                  r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                              (Match m) => '${m[1]}.'),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 15,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    );
  }
}
