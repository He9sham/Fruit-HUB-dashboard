import 'package:commerce_hub_dashboard/features/order/domain/entity/order_entity.dart';
import 'package:commerce_hub_dashboard/features/order/view/widget/filter_section.dart';
import 'package:flutter/material.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          FilterSection(),
          
        ],
      ),
    );
  }
}
