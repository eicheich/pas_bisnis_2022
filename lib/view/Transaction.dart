import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:pas_bisnis_2022/services/Notification.dart';
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/view/purchased.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class transaction extends StatefulWidget {
  transaction({Key? key, required this.data}) : super(key: key);
  Data data;

  @override
  State<transaction> createState() => _transactionState();
}

class _transactionState extends State<transaction> {
  int ship = 45000;
  @override
  void initState() {
    super.initState();
    Notif.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transaction'),
        ),
        body: SingleChildScrollView(
          child: Card(
            child: Column(
              children: [
                Image.network(widget.data.img1.toString()),
                Text(widget.data.title.toString()),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Price : '),
                      Text('Rp.' + widget.data.price.toString()),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Shipment : '),
                      Text('Rp.' + ship.toString()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                // price plus int ship equals
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total : '),
                      Text('Rp.' +
                          (int.parse(ship.toString()) +
                                  int.parse(widget.data.price.toString()))
                              .toString()),
                    ],
                  ),
                ),

                // address
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Address : '),
                      Text('Jl. Kebon Jeruk No. 1'),
                    ],
                  ),
                ),
                // radio button payment
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Payment : '),
                      Row(
                        children: [
                          const Text('Bank Transfer'),
                          Radio(
                            value: 1,
                            groupValue: 1,
                            onChanged: (value) {},
                          ),
                          const Text('Credit Card'),
                          Radio(
                            value: 2,
                            groupValue: 1,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // button buy now
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => purchased(
                                    data: widget.data,
                                  )));
                      Notif.showBigNotification(
                          title: "Your order is confirmed",
                          body: "wait for the " +
                              widget.data.title.toString() +
                              " to arrive",
                         
                          fln: flutterLocalNotificationsPlugin);
                    },
                    child: const Text('Buy Now')),
              ],
            ),
          ),
        ));
  }
}
