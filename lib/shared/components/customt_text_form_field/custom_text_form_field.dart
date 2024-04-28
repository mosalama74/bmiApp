import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.onTap,
    this.validator,
    this.controller,
    this.onFieldSubmitted,
    this.obscureText=false,
    this.bgcolor,
    this.prefixIconcolor,

  });

   String? hintText;
   String? labelText;
   IconData? prefixIcon;
   Widget? suffixIcon;
   TextInputType? keyboardType;
   void Function()? onTap;
   String? Function(String?)? validator;
   TextEditingController? controller;
   void Function(String)? onFieldSubmitted;
   bool obscureText = false;
   Color? bgcolor ;
   Color? prefixIconcolor ;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1),
        color:bgcolor,
      ),
      child: TextFormField(
        style: TextStyle(
          height: 2,
        ),
        keyboardType: keyboardType,
        onTap: onTap,
        validator: validator,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: InputBorder.none,
          prefixIcon: Icon(prefixIcon,color: prefixIconcolor,),
          suffixIcon: suffixIcon,

        ),

      ),
    );
  }
}
