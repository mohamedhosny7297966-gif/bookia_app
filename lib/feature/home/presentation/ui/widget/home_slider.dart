import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List<String> images = [
  "https://as1.ftcdn.net/v2/jpg/04/51/29/96/1000_F_451299622_ca8YVRH8kxyxtzhEo3052tb2a1crwzEm.jpg",
  "https://as1.ftcdn.net/v2/jpg/07/31/79/76/1000_F_731797602_N1Ycye8UHN2HW243CCPzPBwDANA0L54l.jpg",
  "https://as2.ftcdn.net/v2/jpg/06/82/85/19/1000_F_682851935_qNAOtUzHHvcE6YoRjMYMVLFvnY7SGIsj.jpg",
];

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev,current)=> current is getHomeSliderLoading ||
      current is getBestSliderError || current is getHomeSliderSuccess,
  builder: (context, state) {
    if (state is getHomeSliderLoading){
      return Center(child: CircularProgressIndicator(),);
    }else if(state is getHomeSliderSuccess){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: 200.h,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                onPageChanged: (index, _) {
                  setState(() {
                    activeIndex=index;
                  });

                }
            ),
            items: state.Slider.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.amber,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: Image.network(i.image??"").image),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20.h),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: images.length,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColor.primaryColor,
              dotHeight: 10,
            ),
          )
        ],
      );

    }
    else{
      return Text("Error");
    }

  },
);
  }
}
