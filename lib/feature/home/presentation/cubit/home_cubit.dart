import 'package:bloc/bloc.dart';
import 'package:bookia/feature/home/data/model/product_model.dart';
import 'package:bookia/feature/home/data/model/slider_model.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
   getHomeSlider()async{
    emit(getHomeSliderLoading());
    final response= await HomeRepo.getHomeSlider();
    
    if (response is String){
      emit(getHomeSliderError());
    }else if(response is sliderModel){
      emit(getHomeSliderSuccess(response.data?.sliders??[]));
    }
  }
getBestSeller()async{
     emit(getBestSliderLoading());
     final response=await HomeRepo.getBestSellerBook();
     if(response is String){
       emit(getBestSliderError());
     }else if (response  is ProductModel){
       emit(getBestSliderSuccess(response.data?.products??[]));
     }
}
addToCart(int productId)async{
     emit(AddToCartLoading());
     final response=await HomeRepo.addToCart(productId);
     if(response is String){
       emit(AddToCartError());
     }else{
       emit(AddToCartSuccess());
     }
}
}
