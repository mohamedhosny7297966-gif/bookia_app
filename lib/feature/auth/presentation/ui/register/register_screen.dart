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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 29),
              Text(
                "Hello! Register to get \n started",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 32),
              CustomTextField(
                  controller: nameController,
                  hintText: "Username"),
              SizedBox(height: 11),
              CustomTextField(
                  controller: emailController,
                  hintText: "Email"),
              SizedBox(height: 13),
              CustomTextField(
                  controller: passwordController,
                  hintText: "Password"),
              SizedBox(height: 12),
              CustomTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm password"),
              SizedBox(height: 49),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if(state is RegisterLoadingState){
                    showDialog(context: context, builder: (context)=>Center(child:  CircularProgressIndicator()));
                  }else if (state is RegisterErrorState){
                    showDialog(context: context, builder: (context)=>AlertDialog(
                      content: Text(state.errorMessage),
                    ));
                  }else if (state is RegisterSuccessState){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (e)=>false);
                    print("Success");
                  }                },
                child: CustomBotton(
                  title: "Register",
                  onTap: () {
                    context.read<AuthCubit>().register(name: nameController.text, email: emailController.text, password: passwordController.text , confirmPassword: confirmPasswordController.text);
                  },
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 160),
              Align(
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
    );
  }
}
