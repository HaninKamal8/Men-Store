import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/categoriesModel.dart';
import 'categories_state.dart';


class CategoryCubit extends Cubit<CategoriesState> {
  CategoryCubit() : super(CategoriesInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  final Dio dio = Dio();

  List<CategoryModel> categories = [];

  Future<void> getCategories() async {
    emit(CategoriesLoading());

    try {
      final Response response = await dio.get(
        "https://fakestoreapi.com/products/categories",
      );

      categories = (response.data as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();


      categories.insert(
        0,
        CategoryModel(name: "All"),
      );

      emit(CategoriesSuccess(categories));
    } on DioException catch (e) {
      emit(
        CategoriesFailure(
          e.response?.data["message"] ??
              e.message ??
              "Something went wrong",
        ),
      );
    } catch (e) {
      emit(
        CategoriesFailure(
          e.toString(),
        ),
      );
    }
  }
}



