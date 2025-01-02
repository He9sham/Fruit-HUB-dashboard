import 'package:commerce_hub_dashboard/core/errors/failures.dart';
import 'package:commerce_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:commerce_hub_dashboard/core/services/firestore_service.dart';
import 'package:commerce_hub_dashboard/features/add_product/data/models/add_product_models.dart';
import 'package:commerce_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:dartz/dartz.dart';

class ProductRepoImpl implements ProductRepo {
  final FireStoreService fireStoreService;
  ProductRepoImpl(this.fireStoreService);

  @override
  Future<Either<Failure, String>> addProduct(
      AddProductInput addProductInput) async {
    try {
      await fireStoreService.addData(
        path: 'products',
        data: AddProductModels.fromEntity(addProductInput).toJson(),
      );
      return Right('Product added successfully');
    } catch (e) {
      return Left(
        ServerFailure(
          'Failed to add product',
        ),
      );
    }
  }
}
