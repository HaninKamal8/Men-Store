import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/productModel.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final Dio dio = Dio();

  List<ProductModel> products = [];


  /// Get All Products


  Future<void> getProducts() async {
    emit(HomeLoading());

    try {
      final Response response = await dio.get(
        "https://fakestoreapi.com/products",
      );

      final List data = response.data;

      products = data
          .map((e) => ProductModel.fromJson(e))
          .toList();

      emit(HomeSuccess(products));
    } on DioException catch (e) {
      emit(
        HomeFailure(
          e.response?.data["message"] ??
              e.message ??
              "Something went wrong",
        ),
      );
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }


  /// Filter Products By Category


  Future<void> filterProducts({
    required String category,
  }) async {
    emit(HomeLoading());

    try {
      final Response response = await dio.get(
        "https://fakestoreapi.com/products/category/$category",
      );

      final List data = response.data;

      products = data
          .map((e) => ProductModel.fromJson(e))
          .toList();

      emit(HomeSuccess(products));
    } on DioException catch (e) {
      emit(
        HomeFailure(
          e.response?.data["message"] ??
              e.message ??
              "Something went wrong",
        ),
      );
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  /// =============================
  /// Search Products
  /// =============================

  Future<void> searchProducts(String text) async {
    emit(HomeLoading());

    try {
      final Response response = await dio.get(
        "https://fakestoreapi.com/products",
      );

      final List data = response.data;

      final List<ProductModel> allProducts = data
          .map((e) => ProductModel.fromJson(e))
          .toList();

      products = allProducts.where((product) {
        return product.title
            .toLowerCase()
            .contains(text.toLowerCase());
      }).toList();

      emit(HomeSuccess(products));
    } on DioException catch (e) {
      emit(
        HomeFailure(
          e.response?.data["message"] ??
              e.message ??
              "Something went wrong",
        ),
      );
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}