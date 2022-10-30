import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:pas_bisnis_2022/services/Notification.dart';
import 'package:pas_bisnis_2022/view/History.dart';
import 'package:pas_bisnis_2022/view/Navigation.dart';

class purchased extends StatefulWidget {
  purchased({Key? key, required this.data}) : super(key: key);
  Data data;

  @override
  State<purchased> createState() => _purchasedState();
}

class _purchasedState extends State<purchased> {
  int ship = 45000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchased'),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.greenAccent,
            child: Column(
              children: [
                const Text('gambar thx for purchasing '),
                Text('yeah'),
              ],
            ),
          ),
          // button to navigation
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Navigation()));
              },
              child: const Text('Back to Home')),
        ],
      )),
    );
  }
}
