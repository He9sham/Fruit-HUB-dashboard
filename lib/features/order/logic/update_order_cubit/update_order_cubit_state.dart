part of 'update_order_cubit_cubit.dart';

@immutable
sealed class UpdateOrderCubitState {}

final class UpdateOrderCubitInitial extends UpdateOrderCubitState {}
final class UpdateOrderCubitUpdateOrder extends UpdateOrderCubitState {}

