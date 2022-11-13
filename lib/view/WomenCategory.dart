import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WomenCategory extends StatefulWidget {
  const WomenCategory({Key? key}) : super(key: key);

  @override
  State<WomenCategory> createState() => _WomenCategoryState();
}

class _WomenCategoryState extends State<WomenCategory> {
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
                                      DetailPage(data: productModel!.data![1])),
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
                                    productModel!.data![1].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![1].title!,
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
                                    "Sold " + productModel!.data![1].sold!,
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
                                    "Rp. " + productModel!.data![1].price!,
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
                                      DetailPage(data: productModel!.data![2])),
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
                                    productModel!.data![2].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![2].title!,
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
                                    "Sold " + productModel!.data![2].sold!,
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
                                    "Rp. " + productModel!.data![2].price!,
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
                                      DetailPage(data: productModel!.data![5])),
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
                                    productModel!.data![5].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![5].title!,
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
                                    "Sold " + productModel!.data![5].sold!,
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
                                    "Rp. " + productModel!.data![5].price!,
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
                                      DetailPage(data: productModel!.data![7])),
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
                                    productModel!.data![7].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![7].title!,
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
                                    "Sold " + productModel!.data![7].sold!,
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
                                    "Rp. " + productModel!.data![7].price!,
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
                                      data: productModel!.data![11])),
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
                                    productModel!.data![11].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![11].title!,
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
                                    "Sold " + productModel!.data![11].sold!,
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
                                    "Rp. " + productModel!.data![11].price!,
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
                                      data: productModel!.data![13])),
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
                                    productModel!.data![13].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![13].title!,
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
                                    "Sold " + productModel!.data![13].sold!,
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
                                    "Rp. " + productModel!.data![13].price!,
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
                                      data: productModel!.data![15])),
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
                                    productModel!.data![15].title!,
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
                                    "Sold " + productModel!.data![15].sold!,
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
                                    "Rp. " + productModel!.data![15].price!,
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
                                      data: productModel!.data![16])),
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
                                    productModel!.data![16].img1!,
                                    height: 159,
                                    width: 159,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    productModel!.data![16].title!,
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
                                    "Sold " + productModel!.data![16].sold!,
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
                                    "Rp. " + productModel!.data![16].price!,
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
