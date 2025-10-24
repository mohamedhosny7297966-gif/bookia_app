

import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/custom_network_image.dart';
import 'package:bookia/feature/home/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatelessWidget {
  final Products product;
 final void Function()? onTap;
  final void Function()? onTapAddToCart;

  const BookItem({super.key ,required this.product, this.onTap, this.onTapAddToCart});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(12.r),
      width: 163.w,
      height: 281.h,
      decoration: BoxDecoration(
        color: AppColor.backgroundbookColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(imageUrl: product.image??"",
            width: 120.w,height: 155.h,
          radius: 12.r,),
          SizedBox(height: 6.h,),
          Text(product.name??"",style: AppTextStyle.titleMedium,
          maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.price??"",style: AppTextStyle.titleMedium,),
              InkWell(
                onTap: onTapAddToCart,
             child:  Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4.r),

                ),
                child: Text("Buy",style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white
                ),),

              ),),

            ],
          ),

        ],
      ),
    ),);
  }
}
