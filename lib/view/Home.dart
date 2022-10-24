import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50, left: 0, right: 0),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: TextField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(10),
                          //   borderSide: BorderSide(
                          //     color: Colors.grey,
                          //     width: 1,
                          //   ),

                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: Color.fromARGB(255, 162, 162, 162),
                        size: 24.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    CupertinoIcons.cart,
                    color: Color.fromARGB(255, 162, 162, 162),
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ),
              ],
            ),
            Container(
                width: 320,
                height: 515,
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          width: 320,
                          height: 515,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/New arrival.png'),
                                fit: BoxFit.fitWidth),
                          ))),
                ])),
            Container(
                width: 390,
                height: 45,
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          width: 390,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ))),
                  Positioned(
                      top: 12,
                      left: 79,
                      child: Text(
                        'Try it and free returns',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Lexend',
                            fontSize: 17,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                ])),
            Container(
                padding: EdgeInsets.only(top: 20),
                width: 390,
                height: 287,
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          width: 390,
                          height: 287,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(217, 217, 217, 1),
                            image: DecorationImage(
                                image: AssetImage('assets/images/Promo.png'),
                                fit: BoxFit.fitWidth),
                          ))),
                ]))
          ],
        ),
      ),
    );
  }
}
