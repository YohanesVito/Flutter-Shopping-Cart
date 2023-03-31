class ProductItems {
  final String title;
  final String pathImage;
  final double weight;
  final double price;
  int quantity;

  ProductItems({
    required this.title,
    required this.pathImage,
    required this.weight,
    required this.price,
    this.quantity = 0,
  });

  int getQuantity() {
    return quantity;
  }
}
