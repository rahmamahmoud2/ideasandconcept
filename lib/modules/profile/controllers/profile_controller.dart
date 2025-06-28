import 'package:get/get.dart';
import '../../../data/models/user_model.dart';

class ProfileController extends GetxController {
  var user = UserModel(
    id: '25630024',
    name: 'Madison Smith',
    email: 'madisons@example.com',
    phone: '01012345678',
    gender: 'Female',
    dob: '2000-12-25',

    imageUrl:
        'https://images.unsplash.com/photo-1607746882042-944635dfe10e?auto=format&fit=crop&w=500&q=80',
  ).obs;
}
