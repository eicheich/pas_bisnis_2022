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
        title: Text(widget.data.title.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.data.title.toString()),
            Text(widget.data.price.toString()),
            Text(widget.data.desc.toString()),
            Text('rating : ' + widget.data.rating.toString()),
            Text(widget.data.brand.toString()),
            Image.network(widget.data.img1.toString()),
            Image.network(widget.data.img2.toString()),
            Image.network(widget.data.imgbrand.toString()),
          ],
        ),
      ),
    );
  }
}
