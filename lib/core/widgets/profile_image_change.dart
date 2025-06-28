import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ideas_concept_task/core/constants/colors.dart';
import 'package:ideas_concept_task/core/constants/sizes.dart';
import 'package:ideas_concept_task/modules/profile/controllers/edit_profile_controller.dart';

Stack profileimagechange() {
  final controller = Get.find<EditProfileController>();
  return Stack(
    children: [
      Obx(() {
        final file = controller.pickedImage.value;
        return CircleAvatar(
          radius: AppSizes.screenWidth * 0.2,
          backgroundImage: file != null
              ? FileImage(file)
              : NetworkImage(controller.user.value.imageUrl) as ImageProvider,
        );
      }),
      Positioned(
        bottom: 0,
        right: 0,
        child: GestureDetector(
          onTap: controller.pickImage,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.camera_alt, color: Colors.white),
          ),
        ),
      ),
    ],
  );
}
