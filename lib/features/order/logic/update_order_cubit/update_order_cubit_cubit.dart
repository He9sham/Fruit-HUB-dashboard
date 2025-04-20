import 'package:bloc/bloc.dart';
import 'package:commerce_hub_dashboard/core/enums/order_enum.dart';
import 'package:commerce_hub_dashboard/core/repos/order_repo/order_repo.dart';
import 'package:meta/meta.dart';

part 'update_order_cubit_state.dart';

class UpdateOrderCubitCubit extends Cubit<UpdateOrderCubitState> {
  UpdateOrderCubitCubit(this.orderRepo) : super(UpdateOrderCubitInitial());

  final OrderRepo orderRepo;

  Future<void> updateOrder({
    required String orderId,
    required OrderStatusEnum status,
  }) async {
    emit(UpdateOrderCubitLodaing());
    try {
      await orderRepo.updateOrder(orderID: orderId, status: status);
      emit(UpdateOrderCubitSuccess());
    } catch (e) {
      emit(UpdateOrderCubitFailure(errorMessage: e.toString()));
    }
  }
}
