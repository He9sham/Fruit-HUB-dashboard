import 'dart:io';

import 'package:commerce_hub_dashboard/core/theming/colors.dart';
import 'package:commerce_hub_dashboard/core/theming/styles.dart';
import 'package:commerce_hub_dashboard/core/widgets/app_text_buttom.dart';
import 'package:commerce_hub_dashboard/core/widgets/app_text_form_field.dart';
import 'package:commerce_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:commerce_hub_dashboard/features/add_product/logic/cubit/add_product_cubit.dart';
import 'package:commerce_hub_dashboard/features/add_product/view/widgets/add_porducte_bloc.dart';
import 'package:commerce_hub_dashboard/features/add_product/view/widgets/custom_app_bar.dart';
import 'package:commerce_hub_dashboard/features/add_product/view/widgets/image_field.dart';
import 'package:commerce_hub_dashboard/features/add_product/view/widgets/is_featured_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({super.key});

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: autovalidateMode,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  CustomAppBar(),
                  const SizedBox(height: 20),
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
                        code = data!.toLowerCase();
                      },
                      keyboardType: TextInputType.text,
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
                  IsFeaturedCheckBox(
                    onChanged: (value) {
                      isFeatured = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  ImageField(
                    onImageSelected: (value) {
                      image = value;
                    },
                  ),
                  const SizedBox(height: 30),
                  AppTextButton(
                    buttonText: 'Add Product',
                    onPressed: () async {
                      if (image != null) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          AddProductInput input = AddProductInput(
                            image: image!,
                            isFeatured: isFeatured,
                            code: code,
                            name: name,
                            description: description,
                            price: price.toDouble(),
                            imageUrl: '',
                          );
                          context.read<AddProductCubit>().addproduct(input);
                        }
                      } else {
                        showError(context);
                      }
                    },
                    textStyle: Styles.textbuttom16White,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please add product image'),
      ),
    );
  }
}
