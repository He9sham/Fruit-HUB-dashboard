import 'package:commerce_hub_dashboard/core/helper/buid_appbar.dart';
import 'package:commerce_hub_dashboard/core/repos/order_repo/order_repo.dart';
import 'package:commerce_hub_dashboard/core/services/get_it_service.dart';
import 'package:commerce_hub_dashboard/features/order/logic/order_cubit/order_cubit.dart';
import 'package:commerce_hub_dashboard/features/order/view/widget/filter_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(
        getIt.get<OrderRepo>()
      ),
      child: Scaffold(
        appBar: buildAppBar(title: 'Order view'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              FilterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
