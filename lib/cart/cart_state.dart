

import '../models/cartModel.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final Cart cart;

  CartSuccess(this.cart);
}

class CartFailure extends CartState {
  final String msg;

  CartFailure(this.msg);
}
