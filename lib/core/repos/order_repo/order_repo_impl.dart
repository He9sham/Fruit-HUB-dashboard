import 'package:commerce_hub_dashboard/core/errors/failures.dart';
import 'package:commerce_hub_dashboard/core/repos/order_repo/order_repo.dart';
import 'package:commerce_hub_dashboard/core/services/database_service.dart';
import 'package:commerce_hub_dashboard/features/order/data/models/order_models.dart';
import 'package:commerce_hub_dashboard/features/order/domain/entity/order_entity.dart';
import 'package:dartz/dartz.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseService databaseService;

  OrderRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
      final respose = await databaseService.getData(
        path: 'orders',

      );
      List<OrderEntity> order = (respose as List<dynamic>)
          .map((e) => OrderModels.fromJson(e).toEntity())
          .toList() as List<OrderEntity>;
      return Right(order);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
