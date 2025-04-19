import 'package:bloc/bloc.dart';
import 'package:commerce_hub_dashboard/core/enums/order_enum.dart';
import 'package:meta/meta.dart';

part 'update_order_cubit_state.dart';

class UpdateOrderCubitCubit extends Cubit<UpdateOrderCubitState> {
  UpdateOrderCubitCubit() : super(UpdateOrderCubitInitial());

  void updateOrder({
    required String orderID,
    required OrderStatusEnum status,
  }) {
    emit(UpdateOrderCubitUpdateOrder());
  }
}
