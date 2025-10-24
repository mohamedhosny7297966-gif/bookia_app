

import 'package:bookia/feature/cart/data/model/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_style.dart';
import '../../../../../core/widgets/custom_network_image.dart';

class CartBookItem extends StatelessWidget {
  final CartItems? cartItem;
  final Function()? removeOnTap;
  final Function()? increaseQuantity;
  final Function()? decreaseQuantity;

  const CartBookItem({super.key, this.cartItem, this.removeOnTap, this.increaseQuantity, this.decreaseQuantity, });

  @override
  Widget build(BuildContext context) {
    return           Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomNetworkImage(imageUrl: cartItem?.itemProductImage??"",
          width: 100.w, height: 118.h,radius: 12.r,),
        SizedBox(width: 20.w,),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cartItem?.itemProductName??"",style: AppTextStyle.titleMedium,),
            SizedBox(height: 9.h,),
            Text(cartItem?.itemProductPrice??"",style: AppTextStyle.titleSmall,),
            SizedBox(height: 19.h,),
            Row(
              children: [
                InkWell(
                  onTap: increaseQuantity,
                child: Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColor.lighGrayColor,
                  ),
                  child: Icon(Icons.add),

                ),),
                Text(cartItem?.itemQuantity.toString()??"",style: AppTextStyle.titleSmall,),
                SizedBox(width: 6.w,),
                InkWell(
                  onTap: decreaseQuantity,
               child: Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColor.lighGrayColor,
                  ),
                  child: Icon(Icons.remove),

                ),),
              ],
            )


          ],
        ),),
        Container(
          child: Icon(Icons.close),
          decoration: BoxDecoration(
            border: Border.all(width: 2.w),
            shape: BoxShape.circle,
          ),
        ),


      ],
    );
  }
}
