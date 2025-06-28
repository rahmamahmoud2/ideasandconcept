import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideas_concept_task/core/constants/sizes.dart';
import 'package:ideas_concept_task/core/constants/textstyle.dart';
import 'package:ideas_concept_task/core/widgets/custom_textfield.dart';
import 'package:ideas_concept_task/core/widgets/gender_selector.dart';
import 'package:ideas_concept_task/core/widgets/profile_image_change.dart';
import '../../../../core/constants/colors.dart';

import '../../../../core/widgets/custom_button.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  final controller = Get.find<EditProfileController>();

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: AppTextStyles.heading.copyWith(color: AppColors.accent),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(() {
        final user = controller.user.value;

        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    profileimagechange(),
                    SizedBox(height: AppSizes.screenHeight * 0.02),
                    Container(
                      width: AppSizes.screenWidth,
                      height: AppSizes.screenHeight * 0.08,
                      color: AppColors.primary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(user.name, style: AppTextStyles.heading),

                          Text(
                            'ID:${user.id}',
                            style: AppTextStyles.subtitle.copyWith(
                              color: AppColors.textLight,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                        top: 20,
                      ),
                      child: Column(
                        children: [
                          CustomTextField(
                            label: 'Full Name',
                            controller: controller.nameController,
                          ),
                          SizedBox(height: AppSizes.screenHeight * 0.01),

                          CustomTextField(
                            label: 'Email',
                            controller: controller.emailcontroller,
                          ),
                          SizedBox(height: AppSizes.screenHeight * 0.01),
                          CustomTextField(
                            label: 'Phone Number',
                            controller: controller.phoneController,

                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(height: AppSizes.screenHeight * 0.01),

                          CustomTextField(
                            label: 'Date of Birth',
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate:
                                    DateTime.tryParse(controller.dob.value) ??
                                    DateTime(2000),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );
                              if (pickedDate != null) {
                                controller.dob.value = pickedDate
                                    .toIso8601String()
                                    .split('T')
                                    .first;
                              }
                            },
                            hintText: controller.dob.value.isEmpty
                                ? 'Pick a date'
                                : controller.dob.value,
                          ),

                          SizedBox(height: AppSizes.screenHeight * 0.02),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    GenderSelector(
                                      selectedGender: controller.gender.value,
                                      onChanged: (val) =>
                                          controller.gender.value = val,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppSizes.screenHeight * 0.02),

                    CustomButton(
                      text: 'Save Changes',
                      onPressed: controller.saveProfile,
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
