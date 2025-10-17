

import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/model/product_model.dart';

class BookDetailsScreen extends StatelessWidget {
  final Products? product;
  const BookDetailsScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
     child: Column(
        children: [
          Image.network(product?.image??"",
          width: 183.w,
          height: 271.h,),
          Text(product?.name??"", style: AppTextStyle.titleLarge,),
          Text(product?.category??"", style: AppTextStyle.titleSmall.copyWith(
            color: AppColor.primaryColor,
          ),),
      SizedBox(height: 16.h,),
     Expanded(child:
      Text(product?.description ?? "", style: TextStyle(fontSize: 12.sp)),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product?.price??"",style: AppTextStyle.titleMedium,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 14.h),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4.r),

                ),
                child: Text("Add To Cart",style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white
                ),),

              ),

            ],
          ),
          SizedBox(height: 50.h,),
        ],
      ),),
    );
  }
}
