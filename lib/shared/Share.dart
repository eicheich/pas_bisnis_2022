import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SharedCode {
  Color convertHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "0xFF" + hexColor;
    }
    return Color(int.parse(hexColor));
  }

  Widget productUi(
      String productImage, String title, String sold, String price) {
    return Container(
      width: 159,
      margin: EdgeInsets.only(top: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.network(
              productImage,
              height: 159,
              width: 159,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Color(0xFF1B1B1B),
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "Sold " + sold.toString(),
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            child: Text(
              "Rp. " + price.toString(),
              style: TextStyle(
                  color: Color(0xFF1B1B1B),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget placeholder() {
    return Container(
      width: 159,
      margin: EdgeInsets.only(top: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color(0xFFD3D3D3),
            height: 159,
            width: 159,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 18,
            width: 122,
            color: Color(0xFFD3D3D3),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 15,
            width: 43,
            color: Color(0xFFD3D3D3),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            height: 23,
            width: 90,
            color: Color(0xFFD3D3D3),
          ),
        ],
      ),
    );
  }

  Widget placeholderNotifUpper() {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24),
      color: Color(0xFFFAFAFA),
      height: 74,
      child: Row(children: [
        Container(
          height: 24,
          width: 24,
          color: Color(0xFFD3D3D3),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 12, top: 16),
              height: 19,
              width: 73,
              color: Color(0xFFD3D3D3),
            ),
            Container(
              margin: EdgeInsets.only(left: 12, top: 4),
              height: 15,
              width: 140,
              color: Color(0xFFD3D3D3),
            ),
          ],
        ),
        Spacer(),
        Container(
          height: 24,
          width: 24,
          color: Color(0xFFD3D3D3),
        )
      ]),
    );
  }

  Widget placeholderNotifLower() {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 24,
          ),
          Container(
            width: 65,
            height: 65,
            color: Color(0xFFD3D3D3),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: 150,
                color: Color(0xFFD3D3D3),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                height: 15,
                width: 230,
                color: Color(0xFFD3D3D3),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                height: 15,
                width: 200,
                color: Color(0xFFD3D3D3),
              )
            ],
          ),
        ],
      ),
    );
  }

  TextStyle textStyle(
      String fontFamily, double fontSize, Color color, FontWeight fontWeight) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight);
  }

  Widget textFieldUi(
      String Labeltext, bool obscureText, TextEditingController controllerTF) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 3, top: 3),
          alignment: Alignment.topLeft,
          height: 60,
          color: Color.fromRGBO(24, 23, 19, 1),
        ),
        Container(
          padding: EdgeInsets.only(left: 19),
          child: TextField(
            controller: controllerTF,
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: Labeltext,
              labelStyle: TextStyle(
                  fontFamily: "Lexend",
                  fontSize: 19,
                  color: Color(0xFF1B1B1B).withOpacity(0.65),
                  fontWeight: FontWeight.normal),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color(0xFF1B1B1B).withOpacity(0.65)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color(0xFF1B1B1B).withOpacity(0.65)),
              ),
            ),
          ),
          margin: EdgeInsets.only(
            right: 3,
          ),
          alignment: Alignment.bottomRight,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(24, 23, 19, 1),
              width: 1,
            ),
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ],
    );
  }

  Widget buttonUi(String buttonText) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 4, top: 4),
          alignment: Alignment.center,
          height: 60,
          width: 190,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(24, 23, 19, 1),
              width: 1.5,
            ),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            height: 60,
            width: 190,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 24, 23, 19),
            ),
            child: new Text(
              buttonText,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Lexend',
                  fontSize: 20,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
        ),
      ],
    );
  }

  Widget listProfileSetting(
      String image, String title, String desc, Color bgcolor) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 24, right: 24),
        color: bgcolor,
        height: 74,
        child: Row(children: [
          Image.asset(
            image,
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 12, top: 16),
                child: Text(
                  title,
                  style: SharedCode().textStyle(
                      "Lexend", 15, Color(0xFF1B1B1B), FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12, top: 4),
                child: Text(
                  desc,
                  style: SharedCode().textStyle(
                      "Lexend", 12, Color(0xFF1B1B1B), FontWeight.w400),
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 24,
          ),
        ]),
      ),
    );
  }

  Widget listProfileInformation(String image, String title, Color backgorund) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 24, right: 24),
        color: Colors.white,
        height: 74,
        child: Row(children: [
          Image.asset(
            image,
            height: 24,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 12),
                child: Text(
                  title,
                  style: SharedCode().textStyle(
                      "Lexend", 15, Color(0xFF1B1B1B), FontWeight.w500),
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 24,
          ),
        ]),
      ),
    );
  }

  Widget listNotif(String title, String img, String h2) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 24,
          ),
          Container(
            width: 65,
            height: 65,
            child: Image.network(img),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: SharedCode().textStyle(
                    "Lexend", 15, Color(0xFF1B1B1B), FontWeight.w500),
              ),
              Text(
                h2,
                // trim text
                overflow: TextOverflow.ellipsis,
                style: SharedCode().textStyle("Lexend", 12,
                    Color(0xFF1B1B1B).withOpacity(0.75), FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
