import 'package:flutter/material.dart';
import 'package:ideas_concept_task/core/constants/colors.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  const CustomListTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.accent,

        child: Icon(icon, color: AppColors.iconcolor, size: 26),
      ),
      title: Text(title),

      onTap: onTap,
    );
  }
}
