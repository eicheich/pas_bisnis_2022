import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFF181713),
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: Container(
              margin: EdgeInsets.only(left: 1),
              height: 38,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search for something',
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 0,
              ),
              Container(
                child: Text('awawawawaw'),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
