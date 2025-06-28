import 'package:flutter/material.dart';
import 'package:ideas_concept_task/core/constants/colors.dart';
import 'package:ideas_concept_task/core/constants/sizes.dart';

class SectionTab extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SectionTab({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: AppSizes.screenWidth * 0.1,
            color: AppColors.iconcolor,
          ),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.iconcolor,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
