import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_about_b4a_flutter/app/core/models/profile_model.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/entity/profile_entity.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/profile/profile_repository_exception.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/utils/xfile_to_parsefile.dart';
import 'package:learning_about_b4a_flutter/app/data/repositories/profile_repository.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/splash/splash_controller.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/utils/loader_mixin.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/utils/message_mixin.dart';

class UserProfileController extends GetxController
    with LoaderMixin, MessageMixin {
  final ProfileRepository _profileRepository;
  UserProfileController({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final _profile = Rxn<ProfileModel>();
  ProfileModel? get profile => _profile.value;
  set profile(ProfileModel? profileModelNew) => _profile(profileModelNew);

  XFile? _xfile;
  set xfile(XFile? xfile) {
    _xfile = xfile;
  }

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    ProfileModel model = Get.arguments;
    setProfile(model);
    super.onInit();
  }

  setProfile(ProfileModel model) {
    _profile(model);
  }

  Future<void> append({
    String? typeString,
  }) async {
    try {
      _loading(true);
      profile = profile!.copyWith(
        typeString: typeString,
      );

      String userProfileId = await _profileRepository.update(profile!);
      if (_xfile != null) {
        String? photoUrl = await XFileToParseFile.xFileToParseFile(
          xfile: _xfile!,
          className: ProfileEntity.className,
          objectId: userProfileId,
          objectAttribute: 'typeFile',
        );
        profile = profile!.copyWith(typeFile: photoUrl);
      }
      final SplashController splashController = Get.find();
      await splashController.updateUserProfile();
    } on ProfileRepositoryException {
      _message.value = MessageModel(
        title: 'Erro em ProfileController',
        message: 'Não foi possivel salvar o perfil',
        isError: true,
      );
    } finally {
      _loading(false);
    }
  }
}
