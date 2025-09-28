import 'dart:developer';

import 'package:dio/dio.dart';

class AuthRepo {
  static Dio dio = Dio(BaseOptions(
    baseUrl: "https://codingarabic.online/api",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    },
  ));

  static login({required String email, required String password}) async {
    try {
      final response = await dio.post("/login", data: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        return response;
      } else {
        log(response.data["message"]);
        return response.data["message"];
      }
    } catch (e) {
      return "Error try again $e";
    }
  }

  static register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await dio.post("/register", data: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      });
      if (response.statusCode == 200) {
        return response;
      } else {
        log(response.data["message"]);
        return response.data["message"];
      }
    } catch (e) {
      return "Error try again $e";
    }
  }
}
