import 'package:bloc/bloc.dart';
import 'package:commerce_hub_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:commerce_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:commerce_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productRepo)
      : super(AddProductInitial());

  final ImageRepo imageRepo;
  final ProductRepo productRepo;

  Future<void> addproduct(AddProductInput addProductInput) async {
    emit(AddProductLoading());

    final imageUrl = await imageRepo.uploadImage(addProductInput.image);

    imageUrl.fold(
      (f) {
        emit(AddProductFailure(f.toString()));
      },
      (url) async {
        addProductInput.imageUrl = url;
        var result = await productRepo.addProduct(addProductInput);
        result.fold(
          (f) {
            emit(
              AddProductFailure(f.message),
            );
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
