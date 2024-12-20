import 'dart:io';

import 'package:commerce_hub_dashboard/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ImageRepo {
  Future<Either<Failure, String>> uploadImage(File path);
} 