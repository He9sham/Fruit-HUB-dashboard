part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderSuccess extends OrderState {
  final List<OrderEntity> orderEntity;
  OrderSuccess({required this.orderEntity});
}

final class OrderLoading extends OrderState {}

final class OrderFaluire extends OrderState {
  final String errmessage;
  OrderFaluire({required this.errmessage});
}
