import 'dart:convert';

class DbStruct {
  String category;
  String instructions;
  double price;
  String name;
  String photo;
  String temperature;
  String height;
  String pot;
  int productId;
  DbStruct({
    required this.category,
    required this.instructions,
    required this.price,
    required this.name,
    required this.photo,
    required this.temperature,
    required this.height,
    required this.pot,
    required this.productId,
  });

  DbStruct copyWith({
    String? category,
    String? instructions,
    double? price,
    String? name,
    String? photo,
    String? temperature,
    String? height,
    String? pot,
    int? productId,
  }) {
    return DbStruct(
      category: category ?? this.category,
      instructions: instructions ?? this.instructions,
      price: price ?? this.price,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      temperature: temperature ?? this.temperature,
      height: height ?? this.height,
      pot: pot ?? this.pot,
      productId: productId ?? this.productId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'instructions': instructions,
      'price': price,
      'name': name,
      'photo': photo,
      'temperature': temperature,
      'height': height,
      'pot': pot,
      'productId': productId,
    };
  }

  factory DbStruct.fromMap(Map<String, dynamic> map) {
    return DbStruct(
      category: map['category'] ?? '',
      instructions: map['instructions'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      photo: map['photo'] ?? '',
      temperature: map['temperature'] ?? '',
      height: map['height'] ?? '',
      pot: map['pot'] ?? '',
      productId: map['productId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DbStruct.fromJson(String source) =>
      DbStruct.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DbStruct(category: $category, instructions: $instructions, price: $price, name: $name, photo: $photo, temperature: $temperature, height: $height, pot: $pot, productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DbStruct &&
        other.category == category &&
        other.instructions == instructions &&
        other.price == price &&
        other.name == name &&
        other.photo == photo &&
        other.temperature == temperature &&
        other.height == height &&
        other.pot == pot &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    return category.hashCode ^
        instructions.hashCode ^
        price.hashCode ^
        name.hashCode ^
        photo.hashCode ^
        temperature.hashCode ^
        height.hashCode ^
        pot.hashCode ^
        productId.hashCode;
  }
}
