

import 'package:bookia/core/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color:backgroundColor?? AppColor.primaryColor,
      ),
      child: Text(title,style: TextStyle(
        fontSize: 15.sp,
        color:backgroundColor==null? Colors.white: Colors.black,
      ),),
    ),);
  }
}
