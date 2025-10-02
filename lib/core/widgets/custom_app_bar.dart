

import 'package:bookia/core/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding:
    EdgeInsets.symmetric(horizontal: 20.w),
     child:  AppBar(
      leading: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
     child:  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColor.appColor),
        ),
        child: Icon(Icons.arrow_back_ios_new_outlined),
      ),),
    ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56);
}
