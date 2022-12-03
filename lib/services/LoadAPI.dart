// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../model/ProductModel.dart';

// class loadAPI extends StatefulWidget {
//   const loadAPI({Key? key}) : super(key: key);

//   @override
//   State<loadAPI> createState() => _loadAPIState();
// }

// class _loadAPIState extends State<loadAPI> {
//     ProductModel? productModel;
//   bool isloaded = false;

//   void getAllListPL() async {
//     final res = await http.get(
//       Uri.parse("https://api-shoestore.000webhostapp.com/data.php"),
//     );
//     if (res.statusCode == 200) {
//       final data = jsonDecode(res.body);
//       setState(() {
//         productModel = ProductModel.fromJson(data);
//         isloaded = true;
//       });
//     } else {
//       throw Exception("Failed to load data");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Str



//   }
// }
