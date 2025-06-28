import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/models/user_model.dart';
import 'profile_controller.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailcontroller = TextEditingController();

  final gender = ''.obs;
  final dob = ''.obs;

  final pickedImage = Rx<File?>(null);
  final isLoading = false.obs;

  late Rx<UserModel> user;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    user = Get.find<ProfileController>().user;

    nameController.text = user.value.name;
    phoneController.text = user.value.phone;
    emailcontroller.text = user.value.email;
    gender.value = user.value.gender;
    dob.value = user.value.dob;
  }

  Future<void> pickImage() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      pickedImage.value = File(file.path);
    }
  }

  Future<String> uploadImageToCloudinary(File file) async {
    const cloudName = 'dmhjjvk5p';
    const uploadPreset = 'posts_upload';

    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
    );

    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = uploadPreset
      ..files.add(await http.MultipartFile.fromPath('file', file.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final body = await response.stream.bytesToString();
      final data = json.decode(body);
      return data['secure_url'];
    } else {
      throw Exception('Image upload failed');
    }
  }

  Future<void> saveProfile() async {
    try {
      isLoading.value = true;

      String imageUrl = user.value.imageUrl;
      if (pickedImage.value != null) {
        imageUrl = await uploadImageToCloudinary(pickedImage.value!);
      }

      final newUser = user.value.copyWith(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        email: emailcontroller.text.trim(),
        gender: gender.value,
        dob: dob.value,
        imageUrl: imageUrl,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(newUser.id)
          .set(newUser.toMap(), SetOptions(merge: true));

      user.value = newUser;
      Get.back();
      Get.snackbar('Success', 'Profile updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailcontroller.dispose();
    super.onClose();
  }
}
