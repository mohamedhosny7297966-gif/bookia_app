import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/custom_app_bar.dart';
import 'package:bookia/core/widgets/custom_botton.dart';
import 'package:bookia/core/widgets/custom_network_image.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/feature/cart/presentation/ui/widget/cart_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Cart", withBackBottom: false,),
      bottomNavigationBar: IntrinsicHeight(
       child: Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
       child: Column(
        children: [
          BlocBuilder<CartCubit, CartState>(
  builder: (context, state) {
    return Row(
            children: [
              Text("Total"),
              Text(context.read<CartCubit>().totalPrice??""),
            ],
          );
  },
),
          SizedBox(height: 16.h,),
          CustomBotton(title: "Check Out"),
        ],
      ),),),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            BlocBuilder<CartCubit, CartState>(
              buildWhen: (previous,current)=>current is GetCartLoading||
              current is GetCartError|| current is GetCartSuccess,
              builder: (context, state) {
                if(state is GetCartLoading){
                  return Center(child: CircularProgressIndicator(),);
                }else if (state is GetCartSuccess){
                  return state.cartProducts.isEmpty?Lottie.asset("assets/image/empty ghost.json") :Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => CartBookItem(
                        increaseQuantity: (){
                          context.read<CartCubit>().updateCart(cartItemId: state.cartProducts[index].itemId??0, quantity: state.cartProducts[index].itemQuantity!+1);
                        },
                        decreaseQuantity: (){
                          if (state.cartProducts[index].itemQuantity!>1){
                            context.read<CartCubit>().updateCart(cartItemId: state.cartProducts[index].itemId??0, quantity: state.cartProducts[index].itemQuantity!-1);
                          }
                        },
                        removeOnTap: (){
                          context.read<CartCubit>().removeFromCart(state.cartProducts[index].itemId??0);
                        },
                        cartItem: state.cartProducts[index],
                      ),
                      separatorBuilder: (context, index) =>
                          Divider(
                            height: 50.h,
                          ),
                      itemCount: state.cartProducts.length,
                    ),);
                }else{
                  return Text("Error");
                }
              },
            ),
          ],
        ),),
    );
  }
}
