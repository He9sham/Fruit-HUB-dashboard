import 'package:commerce_hub_dashboard/features/order/domain/entity/order_product_entity.dart';

class OrderProducteModel {
  final String code;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProducteModel({
    required this.code,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProducteModel.fromJson(Map<String, dynamic> json) {
    return OrderProducteModel(
      code: json['code'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
    );
  }

  toJson() {
    return {
      'code': code,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  OrderProductEntity toEntity() {
    return OrderProductEntity(
      code: code,
      name: name,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity,
    );
  }
}