

import 'package:commerce_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

abstract class ProductRepo {
  Future<void> addProduct(AddProductInput addProductInput);
}