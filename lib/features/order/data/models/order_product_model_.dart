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
      code: json['id'] as String,
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

  toEntity() {
    return {
      'code': code,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}
