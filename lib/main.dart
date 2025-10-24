


import 'package:bookia/bookia.dart';
import 'package:bookia/core/helper/dio_services.dart';
import 'package:bookia/core/helper/local_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main ()async{

  WidgetsFlutterBinding.ensureInitialized();
  await LocalServices.init();
  DioServices.init();
  await ScreenUtil.ensureScreenSize();
  final token = LocalServices.prefs?.getString("userToken");
  runApp(Bookia());
}