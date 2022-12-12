import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/user/login/login_controller.dart';

class AuthLoginDependencies implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(
          userRepository: Get.find(),
        ));
  }
}
