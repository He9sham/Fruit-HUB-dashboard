

import 'package:commerce_hub_dashboard/core/errors/failures.dart';
import 'package:commerce_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepo {
  Future<Either<Failure , String>> addProduct(AddProductInput addProductInput);
}
