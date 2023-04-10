import 'package:dio/dio.dart';
import './client.dart';

class AuthServices {
  final client = Client.client;
  Future<String> Signup(
      {required String username, required String password}) async {
    String token = "";

    try {
      final response = await client.post(
        "api/register/",
        data: {"username": username, "password": password},
      );
      token = response.data["access_token"];
    } on DioError catch (error) {
      print(error);
    }

    return token;
  }

  Future<String> Signin(
      {required String username, required String password}) async {
    String token = "";
    try {
      print({"username": username, "password": password});
      final response = await client.post("api/login/",
          data: {"username": username, "password": password});
      token = response.data["access_token"];
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }
}
