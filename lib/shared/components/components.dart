import 'package:bmicalculator/shared/network/local/cachehelper/cachehelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


var uId = CacheHelper.getData(key: 'uId') ;

showToast({required String? message,required ToastStates state}){
  Fluttertoast.showToast(
      msg:'$message',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: toastcolor(state),
      textColor: Colors.white,
      fontSize: 16.0

  );
}

enum ToastStates{SUCCESS , ERROR , WARNING}

Color toastcolor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;

}