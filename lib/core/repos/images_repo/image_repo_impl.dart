import 'dart:io';

import 'package:commerce_hub_dashboard/core/errors/failures.dart';
import 'package:commerce_hub_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:commerce_hub_dashboard/core/services/stoarage_service.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageRepoImpl implements ImageRepo {
  final StoarageService stoarageService;
  ImageRepoImpl(this.stoarageService);
  final supabase = Supabase.instance.client;
  @override
  Future<Either<Failure, String>> uploadImage(File path) async {
    final avatarFile = File(path.path);
    final String fullPath = await supabase.storage.from('fruit_hub').upload(
          'public/avatar1.png',
          avatarFile,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );

    if (fullPath.isNotEmpty) {
      return Right(fullPath);
    } else {
      return Left(
        ServerFailure('Failed to upload image, please try again later'),
      );
    }
  }
}
