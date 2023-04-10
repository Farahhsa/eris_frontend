import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/item.dart';
import './client.dart';

class CategoryServices {
  final client = Client.client;

  Future<List> getCategoryByName({
    required String name,
  }) async {
    List items = [];
    try {
      final response = await client.get("api/categories/${name}/");

      items = (response.data['items']);
    } on DioError catch (error) {
      print(error);
    }

    return items;
  }
}
