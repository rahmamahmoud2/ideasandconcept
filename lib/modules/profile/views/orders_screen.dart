import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideas_concept_task/core/constants/colors.dart';
import 'package:ideas_concept_task/core/constants/sizes.dart';
import 'package:ideas_concept_task/core/constants/textstyle.dart';
import 'package:ideas_concept_task/core/widgets/order_item_card.dart';
import 'package:ideas_concept_task/modules/profile/controllers/order_controller.dart';

class OrderScreen extends StatelessWidget {
  final controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(color: AppColors.textDark),
        centerTitle: true,
        title: Text(
          'My Orders',
          style: AppTextStyles.heading.copyWith(color: AppColors.accent),
        ),
      ),
      body: Obx(() {
        final groupedOrders = controller.orders.groupBy((e) => e.status);
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: groupedOrders.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...entry.value
                    .map((order) => OrderItemCard(order: order))
                    .toList(),
              ],
            );
          }).toList(),
        );
      }),
    );
  }
}

extension ListGroupBy<T> on List<T> {
  Map<String, List<T>> groupBy(String Function(T) keySelector) {
    final map = <String, List<T>>{};
    for (var element in this) {
      final key = keySelector(element);
      map.putIfAbsent(key, () => []).add(element);
    }
    return map;
  }
}
