import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/profile/profile_repository_b4a.dart';
import 'package:learning_about_b4a_flutter/app/data/repositories/profile_repository.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/profile/team/edit/profile_edit_controller.dart';

class ProfileEditDependencies implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryB4a(),
    );

    Get.put<ProfileEditController>(
      ProfileEditController(
        profileRepository: Get.find(),
      ),
    );
  }
}
