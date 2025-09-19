

import 'package:bookia/core/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final void Function()? onTap;
  const CustomBotton({super.key, required this.title, this.backgroundColor, this.onTap});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
     child:  Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color:backgroundColor?? AppColor.primaryColor,
      ),
      child: Text(title,style: TextStyle(
        fontSize: 15,
        color:backgroundColor==null? Colors.white: Colors.black,
      ),),
    ),);
  }
}
