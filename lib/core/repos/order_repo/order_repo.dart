import 'package:commerce_hub_dashboard/core/errors/failures.dart';
import 'package:commerce_hub_dashboard/features/order/domain/entity/order_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OrderRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();
}




// order -> userUid 
// order -> orderId
// order -> productId
// order -> shippingAddress