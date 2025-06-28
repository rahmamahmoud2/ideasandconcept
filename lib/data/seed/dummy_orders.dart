import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addDummyOrders() async {
  final orders = [
    {
      "id": "ORD1001",
      "title": "Table Lamp",
      "description":
          "Elegant table lamp with warm lighting for a cozy ambiance.",
      "image":
          "https://res.cloudinary.com/dmhjjvk5p/image/upload/v1751111582/tablelamp_fwwt8m.png",
      "date": "2025-06-27",
      "status": "Delivered",
      "price": 350.00,
      "quantity": 1,
    },
    {
      "id": "ORD1002",
      "title": "Comod",
      "description":
          "Spacious wooden comod with three drawers and sleek design.",
      "image":
          "https://res.cloudinary.com/dmhjjvk5p/image/upload/v1751111576/buff_nsdd7u.png",
      "date": "2025-06-26",
      "status": "Processing",
      "price": 950.00,
      "quantity": 1,
    },
    {
      "id": "ORD1003",
      "title": "Buffy Chair",
      "description":
          "Comfortable buffy chair with soft fabric and strong legs.",
      "image":
          "https://res.cloudinary.com/dmhjjvk5p/image/upload/v1751111576/download-removebg-preview_eaxzkq.png",
      "date": "2025-06-25",
      "status": "Cancelled",
      "price": 670.00,
      "quantity": 2,
    },
    {
      "id": "ORD1004",
      "title": "Table Decor",
      "description": "Modern decorative piece for tables with golden finish.",
      "image":
          "https://res.cloudinary.com/dmhjjvk5p/image/upload/v1751111574/comod_mltkng.png",
      "date": "2025-06-24",
      "status": "Delivered",
      "price": 250.00,
      "quantity": 1,
    },
    {
      "id": "ORD1005",
      "title": "Table Lamp",
      "description":
          "Elegant table lamp with warm lighting for a cozy ambiance.",
      "image":
          "https://res.cloudinary.com/dmhjjvk5p/image/upload/v1751111582/tablelamp_fwwt8m.png",
      "date": "2025-06-27",
      "status": "Delivered",
      "price": 350.00,
      "quantity": 1,
    },
    {
      "id": "ORD1009",
      "title": "Buffy Chair",
      "description":
          "Comfortable buffy chair with soft fabric and strong legs.",
      "image":
          "https://res.cloudinary.com/dmhjjvk5p/image/upload/v1751111576/download-removebg-preview_eaxzkq.png",
      "date": "2025-06-25",
      "status": "Cancelled",
      "price": 670.00,
      "quantity": 2,
    },
  ];

  for (var order in orders) {
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(order['id'] as String)
        .set(order);
  }
}
