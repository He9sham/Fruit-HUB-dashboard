import 'package:commerce_hub_dashboard/core/helper/build_error_bar.dart';
import 'package:commerce_hub_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:commerce_hub_dashboard/features/add_product/logic/cubit/add_product_cubit.dart';
import 'package:commerce_hub_dashboard/features/add_product/view/widgets/add_product_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductBloc extends StatelessWidget {
  const AddProductBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listenWhen: (previous, current) {
        return current is AddProductSuccess || current is AddProductFailure;
      },
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildBar(context, 'Product added successfully');
        }
        if (state is AddProductFailure) {
          buildBar(context, 'Failed to add product');
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddProductLoading,
          child: AddProductBody(),
        );
      },
    );
  }
}
