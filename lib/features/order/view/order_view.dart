import 'package:commerce_hub_dashboard/core/helper/buid_appbar.dart';
import 'package:commerce_hub_dashboard/core/repos/order_repo/order_repo.dart';
import 'package:commerce_hub_dashboard/core/services/get_it_service.dart';
import 'package:commerce_hub_dashboard/features/order/logic/order_cubit/order_cubit.dart';
import 'package:commerce_hub_dashboard/features/order/logic/update_order_cubit/update_order_cubit_cubit.dart';
import 'package:commerce_hub_dashboard/features/order/view/widget/fetch_order_blocbuilder.dart';
import 'package:commerce_hub_dashboard/features/order/view/widget/update_order_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderCubit>(
          create: (context) => OrderCubit(
            getIt.get<OrderRepo>(),
          ),
        ),
        BlocProvider<UpdateOrderCubitCubit>(
          create: (context) => UpdateOrderCubitCubit(
            getIt.get<OrderRepo>(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: buildAppBar(title: 'Order view'),
        body: UpdateOrderBuilder(
          child: FetchOrderBlocBuilder(),
        ),
      ),
    );
  }
}
