import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/item.dart';
import 'package:flutter_application_1/services/category_services.dart';

class CategoryProvider extends ChangeNotifier {
  List items = [];

  Future getItems({required String name}) async {
    items = await CategoryServices().getCategoryByName(name: name);
    notifyListeners();
  }
}
