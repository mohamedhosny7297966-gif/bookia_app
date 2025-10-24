part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class GetCartSuccess extends CartState {
 final List<CartItems> cartProducts;
  GetCartSuccess(this.cartProducts);
}
final class GetCartLoading extends CartState {}
final class GetCartError extends CartState {}


final class RemoveFromCartSuccess extends CartState {}
final class RemoveFromCartLoading extends CartState {}
final class RemoveFromCartError extends CartState {}

final class UpdateCartSuccess extends CartState {}
final class UpdateCartLoading extends CartState {}
final class UpdateCartError extends CartState {}



