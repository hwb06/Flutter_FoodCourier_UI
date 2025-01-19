class FoodItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String image;
  final int orderCount;
  final bool isPopular;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.image,
    required this.orderCount,
    this.isPopular = false,
  });
}
