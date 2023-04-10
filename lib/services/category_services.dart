import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/item.dart';
import './client.dart';

class CategoryServices {
  final client = Client.client;

  Future<List<Item>> getCategoryByName({
    required String name,
  }) async {
    List<Item> items = [];
    try {
      final response = await client.get("api/categories/${name}/");
      print(response.data['items']);
      items = (response.data['items']);
      print("HELLO ${items}");
      print("HI");
    } on DioError catch (error) {
      print(error);
    }

    return items;
  }
}
