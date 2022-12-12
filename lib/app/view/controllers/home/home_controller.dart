import 'package:fluxus/app/data/repositories/user_repository.dart';
import 'package:fluxus/app/routes.dart';
import 'package:fluxus/app/view/controllers/utils/loader_mixin.dart';
import 'package:fluxus/app/view/controllers/utils/message_mixin.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with LoaderMixin, MessageMixin {
  final UserRepository _userRepository;

  HomeController({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final _loading = false.obs;
  set loading(bool value) => _loading(value);
  final _message = Rxn<MessageModel>();

  @override
  void onInit() async {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> logout() async {
    //print('em home logout ');
    await _userRepository.logout();
    Get.offAllNamed(Routes.userLogin);
  }
}
