import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenCategory extends StatefulWidget {
  const MenCategory({Key? key}) : super(key: key);

  @override
  State<MenCategory> createState() => _MenCategoryState();
}

class _MenCategoryState extends State<MenCategory> {
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
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(data: productModel!.data![0])),
                            );
                          },
                          child: Container(
                            width: 159,
                            margin: EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.network(
                                    productModel!.data![0].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![0].title!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Sold " + productModel!.data![0].sold!,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Rp. " + productModel!.data![0].price!,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(data: productModel!.data![3])),
                            );
                          },
                          child: Container(
                            width: 159,
                            margin: EdgeInsets.only(right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.network(
                                    productModel!.data![3].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![3].title!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Sold " + productModel!.data![3].sold!,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Rp. " + productModel!.data![3].price!,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(data: productModel!.data![4])),
                            );
                          },
                          child: Container(
                            width: 159,
                            margin: EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.network(
                                    productModel!.data![4].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![4].title!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Sold " + productModel!.data![4].sold!,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Rp. " + productModel!.data![4].price!,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(data: productModel!.data![6])),
                            );
                          },
                          child: Container(
                            width: 159,
                            margin: EdgeInsets.only(right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.network(
                                    productModel!.data![6].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![6].title!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Sold " + productModel!.data![6].sold!,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Rp. " + productModel!.data![6].price!,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(data: productModel!.data![8])),
                            );
                          },
                          child: Container(
                            width: 159,
                            margin: EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.network(
                                    productModel!.data![8].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![8].title!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Sold " + productModel!.data![8].sold!,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Rp. " + productModel!.data![8].price!,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(data: productModel!.data![9])),
                            );
                          },
                          child: Container(
                            width: 159,
                            margin: EdgeInsets.only(right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.network(
                                    productModel!.data![9].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![9].title!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Sold " + productModel!.data![9].sold!,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Rp. " + productModel!.data![9].price!,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      data: productModel!.data![10])),
                            );
                          },
                          child: Container(
                            width: 159,
                            margin: EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.network(
                                    productModel!.data![10].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![10].title!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Sold " + productModel!.data![10].sold!,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Rp. " + productModel!.data![10].price!,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      data: productModel!.data![12])),
                            );
                          },
                          child: Container(
                            width: 159,
                            margin: EdgeInsets.only(right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.network(
                                    productModel!.data![12].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![12].title!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Sold " + productModel!.data![12].sold!,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Rp. " + productModel!.data![12].price!,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      data: productModel!.data![14])),
                            );
                          },
                          child: Container(
                            width: 159,
                            margin: EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.network(
                                    productModel!.data![14].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![14].title!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Sold " + productModel!.data![14].sold!,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Rp. " + productModel!.data![14].price!,
                                    style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
