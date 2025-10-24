import 'package:bookia/core/helper/local_services.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/feature/book_detailes/presentation/ui/book_details_screen.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/ui/widget/book_item.dart';
import 'package:bookia/feature/home/presentation/ui/widget/home_app_bar.dart';
import 'package:bookia/feature/home/presentation/ui/widget/home_slider.dart';
import 'package:bookia/feature/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeAppBar(),
              HomeSlider(),
              Text("Best Seller", style: AppTextStyle.titleLarge,),
              Expanded(
                child: BlocConsumer<HomeCubit, HomeState>(
                  listener: (context,state){
                    if(state is AddToCartLoading){
                      showDialog(context: context, builder: (context)=>Center(
                        child: CircularProgressIndicator(),
                      ));
                    }else if(state is AddToCartSuccess){
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("product Added To Cart Successfully")));

                    }
                  },

                  buildWhen: (prev,current)=>current is getBestSliderLoading||
                  current is getBestSliderLoading|| current is getBestSliderSuccess,
                  builder: (context, state) {
                    if(state is getBestSliderLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }else if (state is getBestSliderSuccess){
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                          (crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) => BookItem(
                          product: state.productsList[index],
                          onTap: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetailsScreen(
                              product: state.productsList[index],
                            )));
                          },
                          onTapAddToCart: (){
                            context.read<HomeCubit>().addToCart(state.productsList[index].id??0);
                          },
                        ),
                        itemCount: state.productsList.length,
                      );

                    }
                    else{
                      return Text("Error");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
