import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pas_bisnis_2022/shared/Share.dart';

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
                margin:
                    EdgeInsets.only(top: 18, bottom: 30, left: 16, right: 16),
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
                          child: SharedCode().productUi(
                            productModel!.data![0].img1!,
                            productModel!.data![0].title!,
                            productModel!.data![0].sold!,
                            productModel!.data![0].price!.replaceAllMapped(
                                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => '${m[1]}.'),
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
                          child: SharedCode().productUi(
                            productModel!.data![3].img1!,
                            productModel!.data![3].title!,
                            productModel!.data![3].sold!,
                            productModel!.data![3].price!.replaceAllMapped(
                                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => '${m[1]}.'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
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
                          child: SharedCode().productUi(
                            productModel!.data![4].img1!,
                            productModel!.data![4].title!,
                            productModel!.data![4].sold!,
                            productModel!.data![4].price!.replaceAllMapped(
                                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => '${m[1]}.'),
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
                          child: SharedCode().productUi(
                            productModel!.data![6].img1!,
                            productModel!.data![6].title!,
                            productModel!.data![6].sold!,
                            productModel!.data![6].price!.replaceAllMapped(
                                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => '${m[1]}.'),
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
                          child: SharedCode().productUi(
                            productModel!.data![8].img1!,
                            productModel!.data![8].title!,
                            productModel!.data![8].sold!,
                            productModel!.data![8].price!.replaceAllMapped(
                                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => '${m[1]}.'),
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
                          child: SharedCode().productUi(
                            productModel!.data![9].img1!,
                            productModel!.data![9].title!,
                            productModel!.data![9].sold!,
                            productModel!.data![9].price!.replaceAllMapped(
                                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => '${m[1]}.'),
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
                          child: SharedCode().productUi(
                            productModel!.data![10].img1!,
                            productModel!.data![10].title!,
                            productModel!.data![10].sold!,
                            productModel!.data![10].price!.replaceAllMapped(
                                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => '${m[1]}.'),
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
                          child: SharedCode().productUi(
                            productModel!.data![12].img1!,
                            productModel!.data![12].title!,
                            productModel!.data![12].sold!,
                            productModel!.data![12].price!.replaceAllMapped(
                                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => '${m[1]}.'),
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
                          child: SharedCode().productUi(
                            productModel!.data![14].img1!,
                            productModel!.data![14].title!,
                            productModel!.data![14].sold!,
                            productModel!.data![14].price!.replaceAllMapped(
                                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => '${m[1]}.'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: Container(
                margin:
                    EdgeInsets.only(top: 18, bottom: 30, left: 16, right: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        data: productModel!.data![0])),
                              );
                            },
                            child: SharedCode().placeholder()),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        data: productModel!.data![3])),
                              );
                            },
                            child: SharedCode().placeholder()),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        data: productModel!.data![4])),
                              );
                            },
                            child: SharedCode().placeholder()),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        data: productModel!.data![6])),
                              );
                            },
                            child: SharedCode().placeholder()),
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
                                        data: productModel!.data![8])),
                              );
                            },
                            child: SharedCode().placeholder()),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        data: productModel!.data![9])),
                              );
                            },
                            child: SharedCode().placeholder()),
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
                            child: SharedCode().placeholder()),
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
                            child: SharedCode().placeholder()),
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
                            child: SharedCode().placeholder()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
