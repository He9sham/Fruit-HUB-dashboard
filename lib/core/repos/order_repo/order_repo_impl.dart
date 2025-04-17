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
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      final respose = await databaseService.getData(
        path: 'orders',
      );
      List<OrderEntity> order = (respose as List<dynamic>)
          .map<OrderEntity>((e) => OrderModels.fromJson(e).toEntity())
          .toList();
      yield Right(order);
    } catch (e) {
      yield Left(ServerFailure(e.toString()));
    }
  }
}
