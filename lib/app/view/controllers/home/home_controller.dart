import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/utils/loader_mixin.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/utils/message_mixin.dart';

class HomeController extends GetxController with LoaderMixin, MessageMixin {
  HomeController();

  final _loading = false.obs;
  set loading(bool value) => _loading(value);
  final _message = Rxn<MessageModel>();

  @override
  void onInit() async {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }
}
