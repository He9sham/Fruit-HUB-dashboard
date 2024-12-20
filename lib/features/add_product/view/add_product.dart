import 'dart:io';

import 'package:commerce_hub_dashboard/core/theming/colors.dart';
import 'package:commerce_hub_dashboard/core/widgets/app_text_form_field.dart';
import 'package:commerce_hub_dashboard/features/add_product/view/widgets/image_field.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price, expirationMonths, numberOfCalories, unitAmount;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddProduct'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                AppTextFormField(
                  onSaved: (data) {
                    name = data!;
                  },
                  keyboardType: TextInputType.text,
                  hintText: 'Product Name',
                  validator: (data) {
                    data = data!.trim();
                    if (data.isEmpty) {
                      return 'Please enter product name';
                    }
                  },
                  backgroundColor: ColorsManager.lighterGray,
                  // controller: context.read<LoginCubit>().emailController,
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  onSaved: (data) {
                    price = num.parse(data!);
                  },
                  keyboardType: TextInputType.number,
                  hintText: 'Product Price',
                  validator: (data) {
                    data = data!.trim();
                    if (data.isEmpty) {
                      return 'Please enter product price';
                    }
                  },
                  backgroundColor: ColorsManager.lighterGray,
                  // controller: context.read<LoginCubit>().passwordController,
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  onSaved: (data) {
                    expirationMonths = num.parse(data!);
                  },
                  keyboardType: TextInputType.number,
                  hintText: 'Expiration Months',
                  validator: (data) {
                    data = data!.trim();
                    if (data.isEmpty) {
                      return 'Please enter expiration months';
                    }
                  },
                  backgroundColor: ColorsManager.lighterGray,
                  // controller: context.read<LoginCubit>().passwordController,
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                    onSaved: (data) {
                      numberOfCalories = num.parse(data!);
                    },
                    keyboardType: TextInputType.number,
                    hintText: 'Number Of Calories',
                    validator: (data) {
                      data = data!.trim();
                      if (data.isEmpty) {
                        return 'Please enter number of calories';
                      }
                    },
                    backgroundColor: ColorsManager.lighterGray),
                const SizedBox(height: 20),
                AppTextFormField(
                    onSaved: (data) {
                      unitAmount = num.parse(data!);
                    },
                    keyboardType: TextInputType.number,
                    hintText: 'Unit Amont',
                    validator: (data) {
                      data = data!.trim();
                      if (data.isEmpty) {
                        return 'Please enter Unit amont';
                      }
                    },
                    backgroundColor: ColorsManager.lighterGray),
                const SizedBox(height: 20),
                AppTextFormField(
                    onSaved: (data) {
                      code = data!;
                    },
                    keyboardType: TextInputType.number,
                    hintText: 'Product Code',
                    validator: (data) {
                      data = data!.trim();
                      if (data.isEmpty) {
                        return 'Please enter product code';
                      }
                    },
                    backgroundColor: ColorsManager.lighterGray),
                const SizedBox(height: 20),
                AppTextFormField(
                    onSaved: (data) {
                      description = data!;
                    },
                    keyboardType: TextInputType.text,
                    hintText: 'Product Description',
                    validator: (data) {
                      data = data!.trim();
                      if (data.isEmpty) {
                        return 'Please enter product description';
                      }
                    },
                    backgroundColor: ColorsManager.lighterGray),
                const SizedBox(height: 30),
                ImageField(
                  onImageSelected: (value) {
                    image = value;
                  },
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
