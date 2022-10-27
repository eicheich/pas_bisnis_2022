import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                  height: 450,
                  child: Stack(children: <Widget>[
                    Positioned.fill(
                        child: Container(
                            alignment: Alignment.center,
                            // width: 390,
                            height: 500,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/newin.png'),
                                  fit: BoxFit.fitWidth),
                            ))),
                    Positioned.fill(
                        top: 345,
                        child: Text(
                          'NEW IN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Lexend',
                              fontSize: 30,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned.fill(
                        top: 380,
                        child: Text(
                          'SHOP',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Lexend',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                  ])),
              SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF181713),
                ),
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'TRY IT AND FREE RETURN',
                      style: TextStyle(
                        fontFamily: 'Lexend',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                  height: 260,
                  child: Stack(children: <Widget>[
                    Positioned.fill(
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/Disc.png'),
                                  fit: BoxFit.fitWidth),
                            ))),
                    Positioned.fill(
                        top: 180,
                        child: Text(
                          '   All 25% off \n   for new users',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              // make the font bold

                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Lexend',
                              fontSize: 22,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        )),
                  ])),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                  height: 96,
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                            top: 40,
                            child: Text(
                              '   Shop by Brand',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  // make the font bold

                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'Lexend',
                                  fontSize: 22,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            )),
                      ],
                    ),
                  ))
            ]),
          ),
          // SliverGrid(
          //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //     maxCrossAxisExtent: 200.0,
          //     mainAxisSpacing: 10.0,
          //     crossAxisSpacing: 10.0,
          //     childAspectRatio: 4.0,
          //   ),
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Container(
          //         width: 10,
          //         alignment: Alignment.center,
          //         color: Colors.teal[100 * (index % 9)],
          //         child: Text('Grid Item $index'),
          //       );
          //     },
          //     childCount: 6,
          //   ),
          // ),
          // gridview
          
        ],
      ),
    );
  }
}
