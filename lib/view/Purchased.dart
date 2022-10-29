import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:pas_bisnis_2022/view/Navigation.dart';

class purchased extends StatefulWidget {
  purchased({Key? key, required this.data}) : super(key: key);
  Data data;

  @override
  State<purchased> createState() => _purchasedState();
}

class _purchasedState extends State<purchased> {
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
          SizedBox(
            height: 20,
          ),
          const Text('Thank You For Purchasing'),
          Image.network(widget.data.img1.toString()),
          const SizedBox(
            height: 20,
          ),
          Text(widget.data.title.toString()),
          const SizedBox(
            height: 20,
          ),
          Text('Rp.' + widget.data.price.toString()),
          const SizedBox(
            height: 20,
          ),
          Text('Your Order Will Be Delivered In 2 Days'),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Navigation())),
              child: const Text('Back To Home'))
        ],
      )),
    );
  }
}
