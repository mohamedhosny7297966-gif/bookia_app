import 'package:bookia/core/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  const CustomTextField({super.key,required this.hintText, this.isPassword=false, required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText=true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColor.primaryColor,
      obscureText: widget.isPassword&&obscureText,
      decoration: InputDecoration(
        fillColor: AppColor.lighGrayColor,
        filled: true,
        hintText: widget.hintText,
        suffixIcon: widget.isPassword? InkWell(
          onTap: (){
            setState(() {
              obscureText=!obscureText;
            });
          },

            child: Icon(obscureText? Icons.visibility_off_sharp:Icons.visibility_sharp)):null,

      hintStyle:  TextStyle(
        fontSize: 15,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColor.appColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColor.primaryColor),
      ),
      ),
    );
  }
}