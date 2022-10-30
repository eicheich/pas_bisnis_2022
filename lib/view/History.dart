import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);


  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int ship = 45000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      // purchase history
    );
  }
}
