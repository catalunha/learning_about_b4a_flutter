import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/user/login/user_login_controller.dart';

class UserLoginDependencies implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserLoginController>(() => UserLoginController(
          userRepository: Get.find(),
        ));
  }
}
