// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_application_1/models/item.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'user.g.dart'; // i want u to genarate me a file form this file
part 'category.g.dart';

@JsonSerializable() // this should be befor the class
class Category {
  int? id;
  String name;

  Category({
    this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
