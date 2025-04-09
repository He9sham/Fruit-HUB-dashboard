import 'package:commerce_hub_dashboard/features/order/data/models/order_models.dart';
import 'package:flutter/material.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({super.key, required this.orderEntity});
  final List<OrderEntity> orderEntity;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return OrderItemWidget(
          orderModel: orderEntity[index],
        );
      },
    );
  }
}
