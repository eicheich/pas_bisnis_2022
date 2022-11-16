import 'package:flutter/material.dart';

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

  TextStyle textStyle(
      String fontFamily, double fontSize, Color color, FontWeight fontWeight) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight);
  }
}
