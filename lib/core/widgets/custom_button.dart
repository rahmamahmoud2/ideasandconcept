import 'package:flutter/material.dart';
import 'package:ideas_concept_task/core/constants/sizes.dart';
import 'package:ideas_concept_task/core/constants/textstyle.dart';
import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return SizedBox(
      width: AppSizes.screenWidth * 0.7,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.button.copyWith(color: AppColors.background),
        ),
      ),
    );
  }
}
