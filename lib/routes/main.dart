import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideas_concept_task/data/seed/dummy_orders.dart';
import 'package:ideas_concept_task/modules/profile/bindings/edit_profile_binding.dart';
import 'package:ideas_concept_task/modules/profile/bindings/order_binding.dart';
import 'package:ideas_concept_task/modules/profile/bindings/profile_binding.dart';
import 'package:ideas_concept_task/modules/profile/views/edit_profile_screen.dart';
import 'package:ideas_concept_task/modules/profile/views/orders_screen.dart';
import 'package:ideas_concept_task/modules/profile/views/profile_viewscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Profile Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/profile',
      getPages: [
        GetPage(
          name: '/profile',
          page: () => ProfileScreen(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: '/profile/edit',
          page: () => EditProfileScreen(),
          binding: EditProfileBinding(),
        ),
        GetPage(
          name: '/orders',
          page: () => OrderScreen(),
          binding: OrderBinding(),
        ),
      ],
    );
  }
}
