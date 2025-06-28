class OrderModel {
  final String id;
  final String title;
  final String description;
  final String image;
  final String date;
  final String status;
  final double price;
  final int quantity;

  OrderModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.date,
    required this.status,
    required this.price,
    required this.quantity,
  });

  double get total => price * quantity;

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      date: map['date'] ?? '',
      status: map['status'] ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      quantity: (map['quantity'] ?? 0).toInt(),
    );
  }
}
