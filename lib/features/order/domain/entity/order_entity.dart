import 'package:commerce_hub_dashboard/features/order/domain/entity/order_product_entity.dart';
import 'package:commerce_hub_dashboard/features/order/domain/entity/shipping_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final ShippingAddresEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProductEntity;
  final String paymentMethod;

  OrderEntity({
    required this.totalPrice,
    required this.uId,
    required this.paymentMethod,
    required this.shippingAddressEntity,
    required this.orderProductEntity,
  });
}
