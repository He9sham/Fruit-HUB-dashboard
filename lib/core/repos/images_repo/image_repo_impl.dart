

import 'package:commerce_hub_dashboard/core/errors/failures.dart';
import 'package:commerce_hub_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:commerce_hub_dashboard/core/services/stoarage_service.dart';
import 'package:dartz/dartz.dart';

class ImageRepoImpl implements ImageRepo {
  final StoarageService stoarageService;
  ImageRepoImpl(this.stoarageService);
  @override
  Future<Either<Failure, String>> uploadImage(path) async {
    try {
      String url = await stoarageService.uploadImage(path, 'images');
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure(
          'Failed to upload image',
        ),
      );
    }
  }
}
