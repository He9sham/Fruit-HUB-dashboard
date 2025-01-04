import 'package:commerce_hub_dashboard/core/errors/failures.dart';
import 'package:commerce_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:commerce_hub_dashboard/core/services/database_service.dart';
import 'package:commerce_hub_dashboard/features/add_product/data/models/add_product_models.dart';
import 'package:commerce_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:dartz/dartz.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;
  ProductRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, void>> addProduct(
      AddProductInput addProductInputEntity) async {
    try {
      await databaseService.addData(
        path: 'products',
        data: ProductModel.fromEntity(addProductInputEntity).toJson(),
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product'));
    }
  }
}
