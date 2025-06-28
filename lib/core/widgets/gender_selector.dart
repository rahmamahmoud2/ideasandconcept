import 'package:flutter/material.dart';
import 'package:ideas_concept_task/core/constants/colors.dart';
import 'package:ideas_concept_task/core/constants/sizes.dart';
import 'package:ideas_concept_task/core/constants/textstyle.dart';

class GenderSelector extends StatelessWidget {
  final String selectedGender;
  final Function(String) onChanged;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Row(
      children: [
        buildGenderOption('Male'),
        SizedBox(width: AppSizes.screenWidth * 0.16),
        buildGenderOption('Female'),
      ],
    );
  }

  Widget buildGenderOption(String gender) {
    return Container(
      padding: const EdgeInsets.only(left: 23, right: 26),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Radio<String>(
            value: gender,
            groupValue: selectedGender,
            activeColor: AppColors.accent,
            onChanged: (val) => onChanged(val!),
          ),
          Text(
            gender,
            style: AppTextStyles.subtitle.copyWith(color: AppColors.textDark),
          ),
        ],
      ),
    );
  }
}
