
import 'package:bookia/core/helper/dio_services.dart';
import 'package:bookia/feature/cart/data/model/cart_model.dart';

class CartRepo{


 static getCart()async{
    try{
      final response=await DioServices.dio?.get("/cart");


      if(response?.statusCode==200){
        return cartModel.fromJson(response?.data);
      }else{
        return "Error";
      }
    }catch(e){
      return "Error";
    }
  }
 static removeFromCart(int cartItemId)async{
   try{
     final response= await DioServices.dio?.post("/remove-from-cart",
     data: {
       "cart_item_id": cartItemId
     });
     if(response?.statusCode==200){
       return response;
     }else{
       return "Error";
     }
   }catch(e){
     return "Error";
   }
  }
  static updateCart(
      {required int cartItemId,
        required int quantity,
      }) async{
   try{
     final response =await DioServices.dio?.post("/update-cart",
     data:{
       "cart_item_id": cartItemId,
       "quantity": quantity,

     }
     );
     if (response?.statusCode==201){
       return response;
     }else{
       return "Error";
     }
   }catch (e){
     return "Error";
   }
  }
}