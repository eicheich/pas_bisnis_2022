import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:pas_bisnis_2022/services/Notification.dart';
import 'package:pas_bisnis_2022/services/Wrapper.dart';
import 'package:pas_bisnis_2022/shared/Share.dart';
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/view/purchased.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'History.dart';

const List<String> list = <String>[
  'COD (Cash on Delivery)',
  'Credit / Debit Card',
  'Instalment',
  'UfeePay (Coming soon)'
];

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class transaction extends StatefulWidget {
  transaction({Key? key, required this.data}) : super(key: key);
  Data data;

  @override
  State<transaction> createState() => _transactionState();
}

class _transactionState extends State<transaction> {
  @override
  void initState() {
    super.initState();
    Notif.initialize(flutterLocalNotificationsPlugin);
  }

  String dropdownValue = list.first;
  int quantity = 1;
  int shipment = 20000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1B1B1B),
        title: Text(
          'Checkout',
          style: SharedCode()
              .textStyle("Lexend", 20, Colors.white, FontWeight.w400),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 32, left: 24),
              child: Text("Summary", style: titleTextStyle()),
            ),
            space16(),
            Container(
              height: 274,
              color: Colors.white,
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Arrives Sat, Dec 10 - Thu, Dec 15",
                      style: SharedCode().textStyle(
                          "Lexend", 15, Color(0xFF1B1B1B), FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 171,
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Image.network(widget.data.img1!),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            height: double.maxFinite,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.data.title!,
                                  style: SharedCode().textStyle("Lexend", 14,
                                      Color(0xFF1B1B1B), FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Rp. " +
                                      widget.data.price!
                                          .toString()
                                          .replaceAllMapped(
                                              new RegExp(
                                                  r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                              (Match m) => '${m[1]}.'),
                                  style: SharedCode().textStyle("Poppins", 13,
                                      Color(0xFF1B1B1B), FontWeight.w400),
                                ),
                                SizedBox(height: 31),
                                Container(
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // add plus minus button
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (quantity > 1) {
                                              quantity--;
                                            }
                                          });
                                        },
                                        child: Container(
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        child: Text(
                                          quantity.toString(),
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            color: Color(0xFF1B1B1B),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            quantity >= 5
                                                ? showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Text(
                                                          "Sorry :( , you can't buy more than 5 products at once checkout",
                                                          style: SharedCode()
                                                              .textStyle(
                                                                  "Lexend",
                                                                  14,
                                                                  Color(
                                                                      0xFF1B1B1B),
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              "Ok",
                                                              style: SharedCode()
                                                                  .textStyle(
                                                                      "Lexend",
                                                                      14,
                                                                      Color(
                                                                          0xFF1B1B1B),
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    })
                                                : quantity++;
                                          });
                                        },
                                        child: Container(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: SharedCode().textStyle("Lexend", 15,
                                    Color(0xFF1B1B1B), FontWeight.w400),
                              ),
                              Text(
                                "Rp. " +
                                    (int.parse(widget.data.price!) * quantity)
                                        .toString()
                                        .replaceAllMapped(
                                            new RegExp(
                                                r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                            (Match m) => '${m[1]}.'),
                                style: SharedCode().textStyle("Poppins", 14,
                                    Color(0xFF1B1B1B), FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Shipping",
                                style: SharedCode().textStyle("Lexend", 15,
                                    Color(0xFF1B1B1B), FontWeight.w400),
                              ),
                              Text(
                                int.parse(widget.data.price!) * quantity >
                                        750000
                                    ? "Free"
                                    : "Rp. " +
                                        shipment.toString().replaceAllMapped(
                                            new RegExp(
                                                r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                            (Match m) => '${m[1]}.'),
                                style: SharedCode().textStyle("Poppins", 14,
                                    Color(0xFF1B1B1B), FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            space20(),
            Container(
              margin: EdgeInsets.only(left: 24),
              child: Text("Shipment", style: titleTextStyle()),
            ),
            space16(),
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 24, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.email!
                                  .replaceAll("@gmail.com", "")
                                  .replaceAll(".", " ")
                                  .toTitleCase(),
                              style: SharedCode().textStyle("Lexend", 15,
                                  Color(0xFF1B1B1B), FontWeight.w400),
                            ),
                            space5(),
                            Text(
                              "Jl. Lkr. Utara No.7, Bacin, Kec. Bae",
                              style: SharedCode().textStyle("Lexend", 15,
                                  Color(0xFF1B1B1B), FontWeight.w400),
                            ),
                            space5(),
                            Text(
                              "Kudus, Jawa Tengah",
                              style: SharedCode().textStyle("Lexend", 15,
                                  Color(0xFF1B1B1B), FontWeight.w400),
                            ),
                            space5(),
                            Text(
                              "Indonesia",
                              style: SharedCode().textStyle("Lexend", 15,
                                  Color(0xFF1B1B1B), FontWeight.w400),
                            ),
                          ],
                        ),
                        Container(
                          child: Icon(
                            Icons.edit_note_rounded,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            space20(),
            Container(
              margin: EdgeInsets.only(left: 24),
              child: Text("Payment", style: titleTextStyle()),
            ),
            space16(),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 24, right: 24),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: list
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: SharedCode().textStyle("Lexend", 15,
                                  Color(0xFF1B1B1B), FontWeight.w400),
                            ),
                          ))
                      .toList(),
                  value: dropdownValue,
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value as String;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 22,
                    color: Color(0xFF1B1B1B),
                  ),
                  dropdownElevation: 0,
                  // selectedItemHighlightColor: Colors.black.withOpacity(0.05),
                  dropdownDecoration: BoxDecoration(color: Colors.white),
                  buttonHeight: 45,
                  buttonWidth: MediaQuery.of(context).size.width,
                  scrollbarRadius: const Radius.circular(8),
                  dropdownScrollPadding: EdgeInsets.only(right: 10),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  dropdownMaxHeight: 110,
                  offset: const Offset(0, 45),
                  dropdownWidth: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(top: 16, bottom: 8, left: 24, right: 24),
        height: MediaQuery.of(context).size.height / 7,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: SharedCode().textStyle(
                        "Lexend", 16, Color(0xFF1B1B1B), FontWeight.w500),
                  ),
                  Text(
                    "Rp. " +
                        (int.parse(widget.data.price!) * quantity +
                                ((int.parse(widget.data.price!) * quantity) >
                                        750000
                                    ? 0
                                    : shipment))
                            .toString()
                            .replaceAllMapped(
                                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => '${m[1]}.'),
                    style: SharedCode().textStyle(
                        "Poppins", 18, Color(0xFF1B1B1B), FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 14),
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF1B1B1B),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => purchased(
                                data: widget.data,
                              )));
                  Notif.showBigNotification(
                      title: "Your order is confirmed",
                      body: "Thanks for your order, wait for the " +
                          widget.data.title.toString() +
                          " to arrive",
                      fln: flutterLocalNotificationsPlugin);
                },
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: "Lexend",
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle titleTextStyle() {
    return SharedCode()
        .textStyle("Lexend", 20, Color(0xFF1B1B1B), FontWeight.w500);
  }

  Widget space16() {
    return SizedBox(height: 16);
  }

  Widget space20() {
    return SizedBox(height: 20);
  }

  Widget space5() {
    return SizedBox(height: 5);
  }
}
