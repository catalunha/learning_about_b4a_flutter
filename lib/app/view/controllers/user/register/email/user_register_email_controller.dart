import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/user/user_repository_exception.dart';
import 'package:learning_about_b4a_flutter/app/data/repositories/user_repository.dart';
import 'package:learning_about_b4a_flutter/app/routes.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/utils/loader_mixin.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/utils/message_mixin.dart';

class UserRegisterEmailController extends GetxController
    with LoaderMixin, MessageMixin {
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final UserRepository _userRepository;
  UserRegisterEmailController({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> registerEmail({
    required String email,
    required String password,
  }) async {
    try {
      _loading(true);
      final user = await _userRepository.register(
        email: email,
        password: password,
      );
      if (user != null) {
        Get.offAllNamed(Routes.userLogin);
      } else {
        _message.value = MessageModel(
          title: 'Erro',
          message: 'Em registrar usuário',
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
}
