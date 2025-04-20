import 'package:commerce_hub_dashboard/core/helper/build_error_bar.dart';
import 'package:commerce_hub_dashboard/features/order/logic/update_order_cubit/update_order_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateOrderBuilder extends StatelessWidget {
  const UpdateOrderBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubitCubit, UpdateOrderCubitState>(
      listener: (context, state) {
        if (state is UpdateOrderCubitSuccess) {
          buildBar(
            context,
            'Order updated successfully',
          );
        } else if (state is UpdateOrderCubitFailure) {
          buildBar(
            context,
            state.errorMessage,
          );
        } 
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateOrderCubitLodaing,
          child: child,
        );
      },
    );
  }
}
