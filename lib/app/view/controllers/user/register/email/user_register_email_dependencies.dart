import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/user/register/email/user_register_email_controller.dart';

class UserRegisterEmailDependencies implements Bindings {
  @override
  void dependencies() {
    Get.put<UserRegisterEmailController>(
      UserRegisterEmailController(
        userRepository: Get.find(),
      ),
    );
  }
}
