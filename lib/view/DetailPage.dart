import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.data}) : super(key: key);
  Data data;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          children: const [
            Text('Detail Page'),
          ],
        ),
      ),
    );
    
  }
}