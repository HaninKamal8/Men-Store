import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project3/Auth/SignIn/sign_in_bloc.dart';
import 'package:project3/Auth/SignIn/sign_in_state.dart';

import '../../core/helpers/AppField.dart';
import '../../core/helpers/AppPasswordfield.dart';
import '../../core/helpers/AppToast.dart';
import '../../core/homeNav/BottomNavBar/NavBar.dart';
import '../SignUp/SignUp.dart';



class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            AppToast.success(context, "Login Successfully");

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const CustomBottomNavBar(),
              ),
            );
          }

          if (state is LoginFailure) {
            AppToast.error(context, state.msg);
          }
        },
        builder: (context, state) {
          final cubit = LoginCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      const Text(
                        "Login to your account",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "It's great to see you again.",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 35),

                      const Text(
                        "User Name",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      AppField(
                        controller: cubit.emailController,
                        hint: "Enter your email address",
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      AppPasswordField(
                        controller: cubit.passwordController,
                        hint: "Enter your password",
                        obscureText: cubit.isPassword,
                        suffix: cubit.suffix,
                        onPressed: cubit.changePasswordVisibility,
                      ),

                      const SizedBox(height: 35),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff3D6DCC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: state is LoginLoading
                              ? null
                              : () {
                            cubit.login();
                          },
                          child: state is LoginLoading
                              ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                              : const Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,

                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 35),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Join",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

