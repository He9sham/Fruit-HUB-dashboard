import 'package:commerce_hub_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:commerce_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:commerce_hub_dashboard/core/services/get_it_service.dart';
import 'package:commerce_hub_dashboard/features/add_product/logic/cubit/add_product_cubit.dart';
import 'package:commerce_hub_dashboard/features/add_product/view/widgets/add_porducte_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AddProductCubit(
          getIt.get<ImageRepo>(),
          getIt.get<ProductRepo>(),
        ),
        child: const AddProductBloc(),
      ),
    );
  }
}
