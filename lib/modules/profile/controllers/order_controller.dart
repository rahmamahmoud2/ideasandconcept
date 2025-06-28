import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/models/order_model.dart';

class OrderController extends GetxController {
  final orders = <OrderModel>[].obs;

  @override
  void onInit() {
    fetchOrders();
    super.onInit();
  }

  void fetchOrders() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('orders')
        .get();

    orders.value = snapshot.docs.map((doc) {
      final data = doc.data();
      return OrderModel.fromMap({...data, 'id': doc.id});
    }).toList();
  }
}
