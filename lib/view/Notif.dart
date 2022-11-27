import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/shared/Share.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Notif extends StatefulWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
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
              shadowColor: Colors.transparent,
              backgroundColor: Colors.white,
              title: const Text(
                'Notification',
                style: TextStyle(color: Color(0xFF1B1B1B)),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SharedCode().listProfileSetting(
                      "assets/images/notif_disc.png",
                      "Discount",
                      "Buy shoes to save more"),
                  SharedCode().listProfileSetting(
                      "assets/images/notif_wallet.png",
                      "Transaction",
                      "Payment for transactions 21309.."),
                  SharedCode().listProfileSetting(
                      "assets/images/notif_games.png",
                      "Ufee games",
                      "Win the game to earn rewards"),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: Text(
                      "All notifications (12)",
                      style: SharedCode().textStyle(
                          "Lexend", 18, Color(0xFF1B1B1B), FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SharedCode().listNotif(
                      'Succesful payment',
                      productModel!.data![1].img1!.toString(),
                      'payment for transaction 1235213YZ, \nusing a credit card was successful'),
                  SizedBox(
                    height: 16,
                  ),
                  SharedCode().listNotif(
                      'Succesful payment',
                      productModel!.data![12].img1!.toString(),
                      'payment for transaction 1235213YZ, \nusing a credit card was successful'),
                  SizedBox(
                    height: 16,
                  ),
                  SharedCode().listNotif(
                      'Succesful payment',
                      productModel!.data![16].img1!.toString(),
                      'payment for transaction 1235213YZ, \nusing a credit card was successful'),
                  SizedBox(
                    height: 16,
                  ),
                  SharedCode().listNotif(
                      'Succesful payment',
                      productModel!.data![10].img1!.toString(),
                      'payment for transaction 1235213YZ, \nusing a credit card was successful'),
                ],
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
