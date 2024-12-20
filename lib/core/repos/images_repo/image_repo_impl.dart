import 'dart:io';

import 'package:commerce_hub_dashboard/core/errors/failures.dart';
import 'package:commerce_hub_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:dartz/dartz.dart';

class ImageRepoImpl implements ImageRepo {
  @override
  Future<Either<Failure, String>> uploadImage(File path) {
    
    throw UnimplementedError();
  }
}
