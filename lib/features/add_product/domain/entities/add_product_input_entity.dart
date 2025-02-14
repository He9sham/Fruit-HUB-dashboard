import 'dart:io';

import 'package:commerce_hub_dashboard/features/add_product/domain/entities/review_entity.dart';

class AddProductInput {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;

  final List<ReviewEntity> reviews;
  AddProductInput(
      {required this.name,
      required this.code,
      required this.reviews,
      required this.description,
      required this.price,
      required this.expirationsMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      this.isOrganic = false,
      required this.image,
      required this.isFeatured,
      this.imageUrl});
}
