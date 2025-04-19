import 'package:commerce_hub_dashboard/core/enums/order_enum.dart';
import 'package:commerce_hub_dashboard/features/order/data/models/order_product_model_.dart';
import 'package:commerce_hub_dashboard/features/order/data/models/shipping_model.dart';
import 'package:commerce_hub_dashboard/features/order/domain/entity/order_entity.dart';

class OrderModels {
  final double totalPrice;
  final String uId;
  final ShippingAddresModel shippingAddressModel;
  final List<OrderProducteModel> orderProductModel;
  final String paymentMethod;
  final String status; // this is new parameter
  // final String orderId;

  OrderModels(
      {required this.totalPrice,
      required this.uId,
      required this.status,
      // required this.orderId,
      required this.paymentMethod,
      required this.shippingAddressModel,
      required this.orderProductModel});

  factory OrderModels.fromJson(Map<String, dynamic> json) {
    return OrderModels(
        // orderId: json['orderId'] as String,
        status: json['status'],
        totalPrice: (json['totalPrice']),
        uId: json['uId'],
        paymentMethod: json['paymentMethod'],
        shippingAddressModel:
            ShippingAddresModel.fromJson(json['shippingAddressModel']),
        orderProductModel: List<OrderProducteModel>.from(
          json['orderProductModel']
              .map((e) => OrderProducteModel.fromJson(e))
              .toList(),
        ));
  }

  toJson() {
    return {
      'paymentMethod': paymentMethod,
      'totalPrice': totalPrice,
      // 'orderId': orderId,
      'uId': uId,
      'status': 'pending',
      'date': DateTime.now().toString(),
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
    };
  }

  OrderEntity toEntity() {
    // Convert status string to OrderStatusEnum
    OrderStatusEnum statusEnum;
    switch (status) {
      case 'pending':
        statusEnum = OrderStatusEnum.pending;
        break;
      case 'accepted':
        statusEnum = OrderStatusEnum.accepted;
        break;
      case 'delivered':
        statusEnum = OrderStatusEnum.delivered;
        break;
      case 'cancelled':
        statusEnum = OrderStatusEnum.cancelled;
        break;
      default:
        statusEnum = OrderStatusEnum.pending;
    }

    return OrderEntity(
      paymentMethod: paymentMethod,
      totalPrice: totalPrice,
      uId: uId,
      status: statusEnum,
      shippingAddressEntity: shippingAddressModel.toEntity(),
      orderProductEntity: orderProductModel.map((e) => e.toEntity()).toList(),
    );
  }
}
