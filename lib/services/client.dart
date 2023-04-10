import 'package:dio/dio.dart';

class Client {
  static Dio client = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000/"));
  Client._();
}
