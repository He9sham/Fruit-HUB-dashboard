import 'package:commerce_hub_dashboard/core/helper/spacing.dart';
import 'package:commerce_hub_dashboard/features/order/domain/entity/order_entity.dart';
import 'package:commerce_hub_dashboard/features/order/logic/order_cubit/order_cubit.dart';
import 'package:commerce_hub_dashboard/features/order/view/widget/filter_section.dart';
import 'package:commerce_hub_dashboard/features/order/view/widget/order_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<OrderCubit>().fetchOrders();
          Future.delayed(const Duration(seconds: 2));
        },
        child: Column(
          children: [
            FilterSection(),
            verticalSpace(16),
            Expanded(
              child: OrderItemListView(
                orderEntity: orders,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
