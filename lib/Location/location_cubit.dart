import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/locationModel.dart';

import 'location_state.dart';

class LocationCubit extends Cubit<AddressState> {
  LocationCubit() : super(AddressInitial());

  static LocationCubit get(context) => BlocProvider.of(context);

  final Dio dio = Dio();

  List<LocationModel> locations = [];

  Future<void> getLocations() async {
    emit(AddressLoading());

    try {
      final Response response = await dio.get(
        'https://api.escuelajs.co/api/v1/locations',
      );

      locations = (response.data as List)
          .map((e) => LocationModel.fromJson(e))
          .toList();

      emit(AddressSuccess(locations));
    } on DioException catch (e) {
      emit(
        AddressFailure(
          e.response?.data["message"] ??
              e.message ??
              "Something went wrong",
        ),
      );
    } catch (e) {
      emit(AddressFailure(e.toString()));
    }
  }
}