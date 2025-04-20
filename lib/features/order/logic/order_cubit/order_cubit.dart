import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commerce_hub_dashboard/core/repos/order_repo/order_repo.dart';
import 'package:commerce_hub_dashboard/features/order/domain/entity/order_entity.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());

  final OrderRepo orderRepo;
  StreamSubscription? streamSubscription;
  Future<void> fetchOrders() async {
    emit(OrderLoading());
    streamSubscription = orderRepo.fetchOrders().listen((result) {
      result.fold((f) {
        emit(OrderFaluire(errmessage: f.message));
      }, (r) {
        emit(OrderSuccess(
          orderEntity: r,
        ));
      });
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
