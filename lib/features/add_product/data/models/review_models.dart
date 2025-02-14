import 'package:commerce_hub_dashboard/features/add_product/domain/entities/review_entity.dart' show ReviewEntity;

class ReviewModels {
  final String name;
  final String image;
  final String reviewDescription;
  final int ratting;
  final String date;

  ReviewModels(
      {required this.name,
      required this.image,
      required this.reviewDescription,
      required this.ratting,
      required this.date});

  factory ReviewModels.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModels(
        name: reviewEntity.name,
        image: reviewEntity.image,
        ratting: reviewEntity.ratting,
        date: reviewEntity.date,
        reviewDescription: reviewEntity.reviewDescription);
  }

  factory ReviewModels.fromJson(Map<String, dynamic> json) {
    return ReviewModels(
        name: json['name'],
        image: json['image'],
        ratting: json['ratting'],
        date: json['date'],
        reviewDescription: json['reviewDescription']);
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'ratting': ratting,
      'date': date,
      'reviewDescription': reviewDescription
    };
  }
}
