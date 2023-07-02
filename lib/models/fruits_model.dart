import 'dart:convert';

class Fruit {
  final String name;
  final String image;
  final double price;
  final String unit;
  Fruit({
    required this.name,
    required this.image,
    required this.price,
    required this.unit,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'price': price,
      'unit': unit,
    };
  }

  factory Fruit.fromMap(Map<String, dynamic> map) {
    return Fruit(
      name: map['name'] ?? '',
      image: map['image'] ?? 'assets/images/fruits/apple.png',
      price: map['price'] ?? 0.0,
      unit: map['unit'] ?? 'kg',
    );
  }

  String toJson() => json.encode(toMap());

  factory Fruit.fromJson(String source) =>
      Fruit.fromMap(json.decode(source) as Map<String, dynamic>);
}
