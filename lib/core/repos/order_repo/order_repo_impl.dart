import 'package:commerce_hub_dashboard/core/enums/order_enum.dart';
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
      await for (var data in databaseService.fetchStreamData(path: 'orders')) {
        List<OrderEntity> order = (data as List<dynamic>)
            .map<OrderEntity>((e) =>
                OrderModels.fromJson(Map<String, dynamic>.from(e)).toEntity())
            .toList();
        yield Right(order);
      }
    } catch (e) {
      yield Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrder(
      {required String orderID, required OrderStatusEnum status}) async {
    try {
      await databaseService.updateData(
          path: "orders",
          data: {
            'status': status.name,
          },
          documentId: orderID);

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
