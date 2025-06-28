import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideas_concept_task/core/constants/app_padding.dart';
import 'package:ideas_concept_task/core/constants/sizes.dart';
import 'package:ideas_concept_task/core/constants/textstyle.dart';
import 'package:ideas_concept_task/core/widgets/custom_listtile.dart';
import 'package:ideas_concept_task/core/widgets/line.dart';
import '../../../../core/constants/colors.dart';

import '../../../../core/widgets/section_tab.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: AppTextStyles.heading.copyWith(color: AppColors.accent),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/profile/edit'),
            icon: const Icon(Icons.edit_outlined, color: AppColors.accent),
          ),
        ],
      ),
      body: Obx(() {
        final user = controller.user.value;

        return SingleChildScrollView(
          padding: AppPaddings.screen,
          child: Column(
            children: [
              SizedBox(height: AppSizes.screenHeight * 0.02),
              CircleAvatar(
                radius: AppSizes.screenWidth * 0.2,
                backgroundImage: NetworkImage(user.imageUrl),
              ),
              SizedBox(height: AppSizes.screenHeight * 0.01),

              Text(user.name, style: AppTextStyles.heading),

              Text(
                'ID:${user.id}',
                style: AppTextStyles.subtitle.copyWith(
                  color: AppColors.textLight,
                ),
              ),

              SizedBox(height: AppSizes.screenHeight * 0.02),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SectionTab(
                      icon: Icons.person_outline,
                      title: 'Profile',
                      onTap: () {},
                    ),
                    line(),
                    SectionTab(
                      icon: Icons.favorite_border,
                      title: 'Wishlist',
                      onTap: () {},
                    ),
                    line(),
                    SectionTab(
                      icon: Icons.list_alt_outlined,
                      title: 'My Orders',
                      onTap: () => Get.toNamed('/orders'),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSizes.screenHeight * 0.03),

              CustomListTile(
                icon: Icons.vpn_key_outlined,
                title: "Privacy Policy",
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.payment,
                title: "Payment Methods",
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.notifications_none,
                title: "Notification",
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.settings_outlined,
                title: "Settings",
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.help_outline,
                title: "Help",
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.logout,
                title: "Logout",
                isLogout: true,
                onTap: () {},
              ),
            ],
          ),
        );
      }),
    );
  }
}
