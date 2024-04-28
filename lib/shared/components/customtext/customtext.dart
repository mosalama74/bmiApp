import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   CustomText({
    required this.text,
    this.textcolor,
    this.fontsize,
    this.fontfamily,
  });

  final String text;
  double? fontsize;
  Color? textcolor;
  String? fontfamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      style: TextStyle(
        fontSize: fontsize??30,
        color:  textcolor,
        fontFamily: fontfamily,
      ),
    );
  }
}
