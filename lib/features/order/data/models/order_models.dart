import 'package:commerce_hub_dashboard/features/order/data/models/order_product_model_.dart';
import 'package:commerce_hub_dashboard/features/order/data/models/shipping_model.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final ShippingAddresEntity shippingAddressModel;
  final List<OrderProducteEntity> orderProductModel;
  final String paymentMethod;

  OrderEntity(
      {required this.totalPrice,
      required this.uId,
      required this.paymentMethod,
      required this.shippingAddressModel,
      required this.orderProductModel});

  factory OrderEntity.fromJson(Map<String, dynamic> json) {
    return OrderEntity(
      totalPrice: (json['totalPrice'] as num).toDouble(),
      uId: json['uId'] as String,
      paymentMethod: json['paymentMethod'] as String,
      shippingAddressModel:
          ShippingAddresEntity.fromJson(json['shippingAddressModel']),
      orderProductModel: (json['orderProductModel'] as List)
          .map((e) => OrderProducteEntity.fromJson(e))
          .toList(),
    );
  }

  toJson() {
    return {
      'paymentMethod': paymentMethod,
      'totalPrice': totalPrice,
      'uId': uId,
      'status': 'pending',
      'date': DateTime.now().toString(),
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
    };
  }

  toEntity() {
    return {
      'paymentMethod': paymentMethod,
      'totalPrice': totalPrice,
      'uId': uId,
      'status': 'pending',
      'date': DateTime.now().toString(),
      'shippingAddressModel': shippingAddressModel.toEntity(),
      'orderProductModel': orderProductModel.map((e) => e.toEntity()).toList(),
    };
  }
}
