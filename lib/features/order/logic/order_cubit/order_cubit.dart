import 'package:bloc/bloc.dart';
import 'package:commerce_hub_dashboard/core/repos/order_repo/order_repo.dart';
import 'package:commerce_hub_dashboard/features/order/domain/entity/order_entity.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());

  final OrderRepo orderRepo;

  Future<void> fetchOrders() async {
    emit(OrderLoading());
    final result = await orderRepo.fetchOrders();
    result.fold(
      (failure) => emit(OrderFaluire(
        errmessage: failure.message,
      )),
      (orders) => emit(OrderSuccess(
        orderEntity: orders,
      )),
    );
  }
}
