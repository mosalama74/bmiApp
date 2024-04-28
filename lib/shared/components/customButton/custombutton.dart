import 'dart:math';

import 'package:bmicalculator/moduls/bmi_results_screen/bmiresultscreen.dart';
import 'package:bmicalculator/shared/components/customtext/customtext.dart';
import 'package:bmicalculator/shared/cubit/bmiappcubit.dart';
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {

  CustomMaterialButton({
  this.child,
    this.onPressed,
    this.height,
    this.backgroundcolor,
  });

Color? backgroundcolor;
void Function()? onPressed;
Widget? child;
double? height = 40.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        height:height ,
        color: backgroundcolor,
        child: child,
        textColor: Colors.white,



      ),
    );
  }

}
