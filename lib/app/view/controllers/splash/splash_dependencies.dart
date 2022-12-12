import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/user/user_repository_b4a.dart';
import 'package:learning_about_b4a_flutter/app/data/repositories/user_repository.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/splash/splash_controller.dart';

class SplashDependencies implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(
      () => UserRepositoryB4a(),
    );

    Get.put<SplashController>(
      SplashController(
        userRepository: Get.find(),
      ),
      permanent: true,
    );
  }
}
