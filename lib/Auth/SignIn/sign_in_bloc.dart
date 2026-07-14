import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project3/Auth/SignIn/sign_in_state.dart';

import '../../models/UserModel.dart';



class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final Dio dio = Dio();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPassword = true;

  IconData suffix = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    emit(PasswordVisibilityChanged());
  }

  Usermodel? user;

Future<void> login() async {
try {
emit(LoginLoading());

final Response response = await dio.post(
"https://api.escuelajs.co/api/v1/auth/login",
data:{
  "email": "john@mail.com",
  "password": "changeme"
}
);

if (response.statusCode == 200 || response.statusCode == 201) {
user = Usermodel.fromJson(response.data);
emit(LoginSuccess());
} else {
emit(LoginFailure("No token"));
}
} on DioException catch (e) {
emit(
LoginFailure(
e.response?.data["message"]?.toString() ??
e.message ??
"Login Failed",
),
);
} catch (e) {
emit(LoginFailure(e.toString()));
}}}
