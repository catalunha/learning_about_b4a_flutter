import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/profile/profile_repository_b4a.dart';
import 'package:learning_about_b4a_flutter/app/data/repositories/profile_repository.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/user/profile/user_profile_controller.dart';

class UserProfileDependencies implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryB4a(),
    );

    Get.put<UserProfileController>(
      UserProfileController(
        profileRepository: Get.find(),
      ),
    );
  }
}
