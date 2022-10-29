import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/view/purchased.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class transaction extends StatefulWidget {
  transaction({Key? key, required this.data}) : super(key: key);
  Data data;

  @override
  State<transaction> createState() => _transactionState();
}

class _transactionState extends State<transaction> {
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
                      Text('Rp.' +
                          (int.parse(widget.data.price.toString()) + 10000)
                              .toString()),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Shipment : '),
                      Text('Rp.' + 10000.toString()),
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
                            builder: (context) => purchased(data: widget.data)),
                      );
                    },
                    child: const Text('Buy Now')),
              ],
            ),
          ),
        ));
  }
}
