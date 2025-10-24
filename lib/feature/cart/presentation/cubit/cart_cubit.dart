import 'package:bloc/bloc.dart';
import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:meta/meta.dart';

import '../../data/model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  String? totalPrice;
  getCart({bool withLoading=true})async{
    if(withLoading){
      emit(GetCartLoading());
    }
    final response=await CartRepo.getCart();
    if (response is String){
      emit(GetCartError());

    }else if (response is cartModel){
      totalPrice=response.data?.total;
      emit(GetCartSuccess(response.data?.cartItems??[]));
    }
  }
  removeFromCart(cartItemId)async{
    emit(RemoveFromCartLoading());
    final response=await CartRepo.removeFromCart(cartItemId);
    if(response is String){
      emit(RemoveFromCartError());
    }else{
      emit(RemoveFromCartSuccess());
      getCart(withLoading: false);
    }
  }
  updateCart({required int cartItemId,required int quantity})async{
    emit(UpdateCartLoading());
    final response = await CartRepo.updateCart(cartItemId: cartItemId, quantity: quantity);
    if(response is String){
      emit(UpdateCartError());
    }else{
      emit(UpdateCartSuccess());
      getCart(withLoading: false);
    }
  }
}
