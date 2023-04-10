// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

// part 'user.g.dart'; // i want u to genarate me a file form this file
part 'item.g.dart';

@JsonSerializable() // this should be befor the class
class Item {
  int? id;
  String name;
  String price;
  int category;

  Item({
    this.id,
    required this.name,
    required this.price,
    required this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
