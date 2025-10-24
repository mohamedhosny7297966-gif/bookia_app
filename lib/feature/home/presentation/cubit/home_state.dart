part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class getHomeSliderLoading extends HomeState {}
final class getHomeSliderError extends HomeState {}
final class getHomeSliderSuccess extends HomeState {
  final List<Sliders> Slider;
  getHomeSliderSuccess(this.Slider);
}
final class getBestSliderLoading extends HomeState {}
final class getBestSliderError extends HomeState {}
final class getBestSliderSuccess extends HomeState {
  final List<Products> productsList;
  getBestSliderSuccess(this.productsList);
}
final class AddToCartSuccess extends HomeState {}
final class AddToCartLoading extends HomeState {}
final class AddToCartError extends HomeState {}


