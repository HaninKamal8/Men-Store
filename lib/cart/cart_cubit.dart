import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/cartModel.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  final Dio dio = Dio();

  Cart? cart;

  Future<void> getCart() async {
    emit(CartLoading());

    try {
      final response = await dio.get(
        "https://dummyjson.com/carts/user/1",
      );

      final cartModel = CartModel.fromJson(response.data);

      cart = cartModel.carts.first;

      emit(CartSuccess(cart!));
    } on DioException catch (e) {
      emit(
        CartFailure(
          e.response?.data["message"] ??
              e.message ??
              "Something went wrong",
        ),
      );
    } catch (e) {
      emit(
        CartFailure(
          e.toString(),
        ),
      );
    }
  }
}