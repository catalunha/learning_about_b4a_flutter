import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/user/user_repository_exception.dart';
import 'package:learning_about_b4a_flutter/app/data/repositories/user_repository.dart';
import 'package:learning_about_b4a_flutter/app/routes.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/splash/splash_controller.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/utils/loader_mixin.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/utils/message_mixin.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserLoginController extends GetxController
    with LoaderMixin, MessageMixin {
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final UserRepository _userRepository;
  UserLoginController({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> loginEmail(String email, String password) async {
    try {
      _loading(true);
      final user =
          await _userRepository.login(email: email, password: password);
      if (user != null) {
        final splashController = Get.find<SplashController>();
        splashController.userModel = user;
        final parseUser = await ParseUser.currentUser() as ParseUser;
        splashController.parseUser = parseUser;
        await splashController.updateUserProfile();
        if (user.profile!.isActive == true) {
          Get.offAllNamed(Routes.home);
        } else {
          _loading(false);
          _message.value = MessageModel(
            title: 'Atenção',
            message: 'Seu cadastro esta em análise.',
            isError: true,
          );
        }
      } else {
        _message.value = MessageModel(
          title: 'Erro',
          message: 'Usuário ou senha inválidos.',
          isError: true,
        );
      }
    } on UserRepositoryException catch (e) {
      _loading(false);

      _message.value = MessageModel(
        title: e.code,
        message: e.message,
        isError: true,
      );
    } finally {
      _loading(false);
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      final user = await _userRepository.forgotPassword(email);
      _message.value = MessageModel(
        title: 'Veja seu email',
        message: 'Enviamos instruções de recuperação de senha nele.',
      );
    } on UserRepositoryException {
      _userRepository.logout();
      _message.value = MessageModel(
        title: 'UserRepositoryException',
        message: 'Em recuperar senha',
        isError: true,
      );
    }
  }
}
