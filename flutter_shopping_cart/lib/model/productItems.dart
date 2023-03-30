class ProductItems {
  final String title;
  final String pathImage;
  final double weight;
  final int price;
  int count;

  ProductItems({
    required this.title,
    required this.pathImage,
    required this.weight,
    required this.price,
    this.count = 0,
  });
}

var allProductItems = [
  ProductItems(
    title: "Thronmax Mdrill Zero",
    pathImage: "assets/images/1.jpg",
    price: 500000,
    weight: 1.32,
  ),
  ProductItems(
    title: "HyperX SoloCast",
    pathImage: "assets/images/2.jpg",
    price: 900000,
    weight: 0.8,
  ),
  ProductItems(
    title: "Neumann TLM-102",
    pathImage: "assets/images/3.jpg",
    price: 14000000,
    weight: 4,
  ),
  ProductItems(
    title: "Soundtech 2.1",
    pathImage: "assets/images/4.jpg",
    price: 450000,
    weight: 1.53,
  ),
  ProductItems(
    title: "Fantech Leviosa MCX01",
    pathImage: "assets/images/5.jpg",
    price: 660000,
    weight: 0.9,
  ),
  ProductItems(
    title: "Fifine K678",
    pathImage: "assets/images/6.jpg",
    price: 780000,
    weight: 2.1,
  ),
];
