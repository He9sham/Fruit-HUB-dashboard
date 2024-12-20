import 'dart:io';

class AddProductInput {
  final String name;
  final String code;
  final String description;
  final double price;
  final String imageUrl;
  final File image;
  final bool isFeatured;
  AddProductInput({
    required this.image,
    required this.isFeatured,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}
