


import 'package:bookia/core/widgets/custom_botton.dart';
import 'package:bookia/feature/auth/presentation/ui/login/login_screen.dart';
import 'package:bookia/feature/auth/presentation/ui/register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,image: Image.asset("assets/image/welcome.png").image),
        ),
        child: SafeArea(
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          
          children: [
            SizedBox(height: 135,),
            Row(),
            Image.asset("assets/image/logo2.png"),
            SizedBox(height: 28,),
            Text("Order Your Book Now!", style: TextStyle(
              fontFamily: "DMSerifDisplay",
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),),
            Spacer(),
            CustomBotton(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
              },
              title: "Login",
            ),
            SizedBox(height: 15,),
            CustomBotton(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
              },
              title: "Register",
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 94,),
          ],
        ),),),
      ),
    );
  }
}
