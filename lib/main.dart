


import 'package:bookia/bookia.dart';
import 'package:bookia/core/helper/dio_services.dart';
import 'package:bookia/core/helper/local_services.dart';
import 'package:flutter/cupertino.dart';

void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  DioServices.init();
  await LocalServices.init();
  runApp(Bookia());
}