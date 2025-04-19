import 'package:commerce_hub_dashboard/features/order/domain/entity/order_entity.dart';
import 'package:commerce_hub_dashboard/features/order/view/widget/order_item_widget.dart';
import 'package:flutter/material.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({super.key, required this.orderEntity});
  final List<OrderEntity> orderEntity;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderEntity.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return OrderItemWidget(
          orderEntity: orderEntity[index],
        );
      },
    );
  }
}
