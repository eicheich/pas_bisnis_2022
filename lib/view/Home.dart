import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/model/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:pas_bisnis_2022/view/AllCategory.dart';
import 'package:pas_bisnis_2022/view/Categories/Adidas.dart';
import 'package:pas_bisnis_2022/view/Categories/NewBalane.dart';
import 'package:pas_bisnis_2022/view/Categories/Nike.dart';
import 'package:pas_bisnis_2022/view/Categories/Puma.dart';
import 'package:pas_bisnis_2022/view/Categories/Reebok.dart';
import 'package:pas_bisnis_2022/view/DetailPage.dart';
import 'package:pas_bisnis_2022/view/Categories/Converse.dart';
import 'package:pas_bisnis_2022/view/Cart.dart';
import 'package:pas_bisnis_2022/view/MenCategory.dart';
import 'package:pas_bisnis_2022/view/Search.dart';
import 'package:pas_bisnis_2022/view/WomenCategory.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Text("All")),
    Tab(icon: Text("Men")),
    Tab(icon: Text("Women")),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: list.length, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                bottom: TabBar(
                  padding: EdgeInsets.only(right: 165),
                  indicatorPadding: EdgeInsets.symmetric(vertical: 2),
                  indicatorColor: Color(0xFF1B1B1B),
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  labelColor: Color(0xFF1B1B1B),
                  labelStyle: TextStyle(fontFamily: "Lexend", fontSize: 17.5),
                  unselectedLabelColor: Color(0xFF1B1B1B).withOpacity(0.65),
                  controller: _controller,
                  tabs: list,
                ),
                elevation: 0,
                collapsedHeight: 60,
                backgroundColor: Colors.white,
                floating: true,
                snap: true,
                pinned: true,
                title: Container(
                  margin: EdgeInsets.only(left: 5, right: 0),
                  child: Text(
                    "Home",
                    style: TextStyle(
                        fontFamily: "Lexend",
                        color: Color(0xFF1B1B1B),
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                actions: [
                  Container(
                    child: IconButton(
                      icon: Image.asset(
                        "assets/images/Search.png",
                        color: Color(0xFF1B1B1B),
                        height: 22,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Search()),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    child: IconButton(
                      icon: Image.asset(
                        "assets/images/shop.png",
                        color: Color(0xFF1B1B1B),
                        height: 26,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => cart()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ];
          },
          body: TabBarView(
            controller: _controller,
            children: [
              AllCategory(),
              MenCategory(),
              WomenCategory(),
            ],
          ),
        ),
      ),
    );
  }
}
