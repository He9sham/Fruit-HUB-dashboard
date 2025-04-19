import 'package:commerce_hub_dashboard/core/helper/get_order_dummy_data.dart';
import 'package:commerce_hub_dashboard/features/order/logic/order_cubit/order_cubit.dart';
import 'package:commerce_hub_dashboard/features/order/view/widget/order_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FetchOrderBlocBuilder extends StatefulWidget {
  const FetchOrderBlocBuilder({
    super.key,
  });

  @override
  State<FetchOrderBlocBuilder> createState() => _FetchOrderBlocBuilderState();
}

class _FetchOrderBlocBuilderState extends State<FetchOrderBlocBuilder> {
  @override
  void initState() {
    context.read<OrderCubit>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderFaluire) {
          return Center(
            child: Text(state.errmessage),
          );
        } else if (state is OrderSuccess) {
          return OrderViewBody(orders: state.orderEntity);
        } else {
          return Skeletonizer(
            child: OrderViewBody(
              orders: [
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
              ],
            ),
          );
        }
      },
    );
  }
}
