
import 'package:commerce_hub_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:commerce_hub_dashboard/core/repos/images_repo/image_repo_impl.dart';
import 'package:commerce_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:commerce_hub_dashboard/core/repos/product_repo/product_repo_impl.dart';
import 'package:commerce_hub_dashboard/core/services/database_service.dart';
import 'package:commerce_hub_dashboard/core/services/firestore_service.dart';
import 'package:commerce_hub_dashboard/core/services/stoarage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  // getIt.registerSingleton<StoarageService>(SupabaseStoargeService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<ImageRepo>(
      ImageRepoImpl(getIt.get<StoarageService>()));
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(
      getIt.get<DatabaseService>(),
    ),
  );
}