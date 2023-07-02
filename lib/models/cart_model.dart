import 'dart:convert';

import 'package:employee_forums/models/fruits_model.dart';

class CartModel {
  Fruit fruit;
  int quantity;
  CartModel({
    required this.fruit,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fruit': fruit.toMap(),
      'quantity': quantity,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      fruit: Fruit.fromMap(map['fruit'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
