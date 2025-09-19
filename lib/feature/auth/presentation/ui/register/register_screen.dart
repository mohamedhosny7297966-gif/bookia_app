import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

import "../../../../../core/theme/app_color.dart";
import "../../../../../core/widgets/custom_app_bar.dart";
import "../../../../../core/widgets/custom_botton.dart";
import "../../../../../core/widgets/custom_text_field.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 22),
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
               CustomTextField(hintText: "Username"),
               SizedBox(height: 11),
               CustomTextField(hintText: "Email"),
               SizedBox(height: 13),
               CustomTextField(hintText: "Password"),
              SizedBox(height: 12,),
              CustomTextField(hintText: "Confirm password"),
              SizedBox(height:49,),
              CustomBotton(title: "Register",),
               SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:  EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
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
