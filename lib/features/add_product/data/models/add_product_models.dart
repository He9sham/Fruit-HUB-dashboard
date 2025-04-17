import 'dart:io';
import 'package:commerce_hub_dashboard/features/add_product/data/models/review_models.dart';
import 'package:commerce_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductModel {
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
  final int sellingCount;
  final List<ReviewModels> reviews;
  ProductModel(
      {required this.name,
      required this.code,
      required this.reviews,
      required this.description,
      required this.expirationsMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      required this.price,
      this.sellingCount = 0,
      required this.isOrganic,
      required this.image,
      required this.isFeatured,
      this.imageUrl});

  factory ProductModel.fromEntity(AddProductInput addProductInputEntity) {
    return ProductModel(
        reviews: addProductInputEntity.reviews
            .map((e) => ReviewModels.fromEntity(e))
            .toList(),
        name: addProductInputEntity.name,
        code: addProductInputEntity.code,
        description: addProductInputEntity.description,
        price: addProductInputEntity.price,
        isOrganic: addProductInputEntity.isOrganic,
        image: addProductInputEntity.image,
        expirationsMonths: addProductInputEntity.expirationsMonths,
        numberOfCalories: addProductInputEntity.numberOfCalories,
        unitAmount: addProductInputEntity.unitAmount,
        isFeatured: addProductInputEntity.isFeatured,
        imageUrl: addProductInputEntity.imageUrl);
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'sellingCount': sellingCount,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
