import 'package:flutter/material.dart';
import 'package:ideas_concept_task/core/constants/colors.dart';
import 'package:ideas_concept_task/core/constants/sizes.dart';
import 'package:ideas_concept_task/core/constants/textstyle.dart';
import '../../../../data/models/order_model.dart';

class OrderItemCard extends StatelessWidget {
  final OrderModel order;

  const OrderItemCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order: ${order.status}',
                style: AppTextStyles.subtitle.copyWith(
                  color: AppColors.textLight,
                ),
              ),
              Text(
                order.date,
                style: AppTextStyles.subtitle.copyWith(
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(
                order.image,
                width: AppSizes.screenWidth * 0.21,
                height: AppSizes.screenHeight * 0.1,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.title,
                    style: AppTextStyles.heading.copyWith(
                      fontSize: 16,
                      color: AppColors.accent,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    order.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.heading.copyWith(
                      fontSize: 12,
                      color: AppColors.textLight,
                    ),
                  ),
                  SizedBox(height: AppSizes.screenHeight * 0.01),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '\$${order.price.toStringAsFixed(2)}',
                        style: AppTextStyles.subtitle.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      Text(
                        '${order.quantity}x uds.',
                        style: AppTextStyles.subtitle.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      Text(
                        'Total: \$${order.total.toStringAsFixed(2)}',
                        style: AppTextStyles.subtitle.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),
        Divider(color: AppColors.accent, thickness: 2),
      ],
    );
  }
}
