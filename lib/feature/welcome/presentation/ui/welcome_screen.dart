import 'package:bookia/core/widgets/custom_botton.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia/feature/auth/presentation/ui/login/login_screen.dart';
import 'package:bookia/feature/auth/presentation/ui/register/register_screen.dart';
import 'package:bookia/feature/welcome/presentation/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: Image
              .asset("assets/image/welcome.png")
              .image),
        ),
        child: SafeArea(
          child: Padding(padding:  EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(

              children: [
                SizedBox(height: 135.h,),
                Row(),
                Image.asset("assets/image/logo2.png"),
                SizedBox(height: 28.h,),
                Text("Order Your Book Now!", style: TextStyle(
                  fontFamily: "DMSerifDisplay",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),),
                Spacer(),
                CustomBotton(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>

                        BlocProvider(
                          create: (context) => AuthCubit(),
                          child: LoginScreen(),
                        )

                    ));
                  },
                  title: "Login",
                ),
                SizedBox(height: 15.h,),
                CustomBotton(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            BlocProvider(
                              create: (context) => AuthCubit(),
                              child: RegisterScreen(),
                            )));
                  },
                  title: "Register",
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 94.h,),
              ],
            ),),),
      ),
    );
  }
}
