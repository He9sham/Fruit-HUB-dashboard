import 'package:commerce_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:commerce_hub_dashboard/core/services/database_service.dart';
import 'package:commerce_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';


class ProductRepoImpl implements ProductRepo {
final DatabaseService databaseService;
ProductRepoImpl(this.databaseService);
  

  @override
  Future<void> addProduct(AddProductInput addProductInput) {
    
    throw UnimplementedError();
  }

}