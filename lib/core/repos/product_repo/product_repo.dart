import 'package:commerce_hub_dashboard/features/add_product/domain/entities/add_product_input_entitie.dart';

abstract class ProductRepo {
  Future<void> addProduct(AddProductInput addProductInput);
}
