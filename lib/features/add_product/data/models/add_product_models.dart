import 'dart:io';

import 'package:commerce_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductModels 
{
 final String name;
  final String code;
  final String description;
  final double price;
  final String imageUrl;
  final File image;
  final bool isFeatured;

  AddProductModels(this.name, this.code, this.description, this.price, this.imageUrl, this.image, this.isFeatured,);

  factory AddProductModels.fromEntity(AddProductInput addProductInput) {
    return AddProductModels(
      addProductInput.name,
      addProductInput.code,
      addProductInput.description,
      addProductInput.price,
      addProductInput.imageUrl,
      addProductInput.image,
      addProductInput.isFeatured,
    );
    
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'image': image,
      'isFeatured': isFeatured,
    };
  }
}