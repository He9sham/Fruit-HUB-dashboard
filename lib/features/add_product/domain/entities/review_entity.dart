class ReviewEntity {
  final String name;
  final String image;
  final String reviewDescription;
  final int ratting;
  final String date;

  ReviewEntity(
      {required this.name,
      required this.image,
      required this.reviewDescription,
      required this.ratting,
      required this.date});
}
