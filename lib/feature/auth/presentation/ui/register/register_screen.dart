import "package:bookia/feature/welcome/presentation/cubit/auth_cubit.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/svg.dart";

import "../../../../../core/theme/app_color.dart";
import "../../../../../core/widgets/custom_app_bar.dart";
import "../../../../../core/widgets/custom_botton.dart";
import "../../../../../core/widgets/custom_text_field.dart";
import "../../../../home/presentation/ui/home_screen.dart";
import "../../../../auth/data/model/register_request_model.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool  isEmailValid(String email){
    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }
  @override
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 29),
                const Text(
                  "Hello! Register to get \n started",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 32),
                CustomTextField(controller: nameController, hintText: "Username",
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Username is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 11),
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Email is required";
                    }else if(!isEmailValid(v)){
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 13),
                CustomTextField(
                  controller: passwordController,
                  hintText: "Password",
                  isPassword: true,
                  validator: (v) {
                    if (v== null || v.isEmpty) {
                      return "Password is required";
                    }else if(v.length<8){
                      return "password must be at least 8";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm password",
                  isPassword: true,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Confirm Password is required";
                    }
                    if ( passwordController.text !=v ) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 49),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is RegisterLoadingState) {
                      showDialog(
                        context: context,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is RegisterErrorState) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(state.errorMessage),
                        ),
                      );
                    } else if (state is RegisterSuccessState) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                            (e) => false,
                      );
                      print("Success");
                    }
                  },
                  child: CustomBotton(
                    title: "Register",
                    onTap: () {
                      if (_formKey.currentState?.validate()??false) {
                        context.read<AuthCubit>().register(
                          RegisterRequestModelModel(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                          ),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const SizedBox.shrink(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 160),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account?",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColor.dartColor,
                          ),
                        ),
                        TextSpan(
                          text: " Login Now",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
