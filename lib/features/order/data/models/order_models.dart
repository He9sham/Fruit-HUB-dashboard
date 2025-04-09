import 'package:commerce_hub_dashboard/features/order/data/models/order_product_model_.dart';
import 'package:commerce_hub_dashboard/features/order/data/models/shipping_model.dart';

class OrderModels {
  final double totalPrice;
  final String uId;
  final ShippingAddresModel shippingAddressModel;
  final List<OrderProductModel> orderProductModel;
  final String paymentMethod;

  OrderModels(
      {required this.totalPrice,
      required this.uId,
      required this.paymentMethod,
      required this.shippingAddressModel,
      required this.orderProductModel});

  factory OrderModels.fromJson(Map<String, dynamic> json) {
    return OrderModels(
      totalPrice: (json['totalPrice'] as num).toDouble(),
      uId: json['uId'] as String,
      paymentMethod: json['paymentMethod'] as String,
      shippingAddressModel:
          ShippingAddresModel.fromJson(json['shippingAddressModel']),
      orderProductModel: (json['orderProductModel'] as List)
          .map((e) => OrderProductModel.fromJson(e))
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
}
