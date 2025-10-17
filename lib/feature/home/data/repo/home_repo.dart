

import 'package:bookia/core/helper/dio_services.dart';
import 'package:bookia/feature/home/data/model/product_model.dart';
import 'package:bookia/feature/home/data/model/slider_model.dart';

class HomeRepo {

 static getHomeSlider()async{

   try{
     final response= await DioServices.dio?.get("/sliders");
     if(response?.statusCode==200){
       return sliderModel.fromJson(response?.data);
     }else{
       return "Error";
     }
   }catch(error){
     return error.toString();
   }
 }
 static getBestSellerBook()async{
   try{
     final response=await DioServices.dio?.get("/products-bestseller");
     if(response?.statusCode==200){
       return ProductModel.fromJson(response?.data);
     }else{
       return "Error";
     }
   }catch(error){
     return error.toString();
   }
 }
}