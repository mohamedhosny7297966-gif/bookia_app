import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/widgets/custom_app_bar.dart';
import 'package:bookia/core/widgets/custom_botton.dart';
import 'package:bookia/core/widgets/custom_text_field.dart';
import 'package:bookia/feature/bottom_nav_bar/presentation/ui/widget/bottom_nav_bar_screen.dart';
import 'package:bookia/feature/home/presentation/ui/home_screen.dart';
import 'package:bookia/feature/welcome/presentation/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

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
              SizedBox(height: 29,),
              Text(
                "Welcome back! Glad \n to see you, Again!",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 32,),
              CustomTextField(
                  controller: emailController,
                  hintText: "Enter Your email"
              ),
              SizedBox(height: 15,),
              CustomTextField(
                controller: passwordController,
                hintText: "Enter your password",
                isPassword: true,
              ),
              SizedBox(height: 13,),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: AppColor.darkgrayColor,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if(state is LoginLoadingState){
                    showDialog(context: context, builder: (context)=>Center(child:  CircularProgressIndicator()));
                  }else if (state is LoginErrorState){
                    showDialog(context: context, builder: (context)=>AlertDialog(
                        content: Text(state.errorMessage),
                    ));
                  }else if (state is LoginSuccessState){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomNavBarScreen()), (e)=>false);
                    print("Success");
                  }
                },
                child: CustomBotton(
                  title: "Login",
                  onTap: (){
                    context.read<AuthCubit>().login(email: emailController.text, password: passwordController.text);
                  },
                ),
              ),
              SizedBox(height: 34,),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColor.grayColor,
                      endIndent: 14,
                    ),
                  ),
                  Text(
                    "or login with",
                    style: TextStyle(
                      color: AppColor.darkgrayColor,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColor.grayColor,
                      indent: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.asset("assets/icons/facebook_ic.svg"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.asset("assets/icons/google_ic.svg"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.asset("assets/icons/cib_apple.svg"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 160,),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(
                            text: "Don’t have an account?",
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColor.dartColor,
                            ),
                          ),
                          TextSpan(
                            text: " Register Now",
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ]
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
