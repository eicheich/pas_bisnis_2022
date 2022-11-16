import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pas_bisnis_2022/shared/Share.dart';

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
                margin:
                    EdgeInsets.only(top: 18, bottom: 30, left: 30, right: 30),
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
                          child: SharedCode().productUi(
                              productModel!.data![1].img1!,
                              productModel!.data![1].title!,
                              productModel!.data![1].sold!,
                              productModel!.data![1].price!),
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
                          child: SharedCode().productUi(
                              productModel!.data![2].img1!,
                              productModel!.data![2].title!,
                              productModel!.data![2].sold!,
                              productModel!.data![2].price!),
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
                          child: SharedCode().productUi(
                              productModel!.data![5].img1!,
                              productModel!.data![5].title!,
                              productModel!.data![5].sold!,
                              productModel!.data![5].price!),
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
                          child: SharedCode().productUi(
                              productModel!.data![7].img1!,
                              productModel!.data![7].title!,
                              productModel!.data![7].sold!,
                              productModel!.data![7].price!),
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
                          child: SharedCode().productUi(
                              productModel!.data![11].img1!,
                              productModel!.data![11].title!,
                              productModel!.data![11].sold!,
                              productModel!.data![11].price!),
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
                          child: SharedCode().productUi(
                              productModel!.data![13].img1!,
                              productModel!.data![13].title!,
                              productModel!.data![13].sold!,
                              productModel!.data![13].price!),
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
                          child: SharedCode().productUi(
                              productModel!.data![15].img1!,
                              productModel!.data![15].title!,
                              productModel!.data![15].sold!,
                              productModel!.data![15].price!),
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
                          child: SharedCode().productUi(
                              productModel!.data![16].img1!,
                              productModel!.data![16].title!,
                              productModel!.data![16].sold!,
                              productModel!.data![16].price!),
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
                    EdgeInsets.only(top: 18, bottom: 30, left: 30, right: 30),
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
