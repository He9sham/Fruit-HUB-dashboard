part of 'update_order_cubit_cubit.dart';

@immutable
sealed class UpdateOrderCubitState {}

final class UpdateOrderCubitInitial extends UpdateOrderCubitState {}
final class UpdateOrderCubitLodaing extends UpdateOrderCubitState {}
final class UpdateOrderCubitSuccess extends UpdateOrderCubitState {}
final class UpdateOrderCubitFailure extends UpdateOrderCubitState {
  final String errorMessage;

  UpdateOrderCubitFailure({required this.errorMessage});
}
