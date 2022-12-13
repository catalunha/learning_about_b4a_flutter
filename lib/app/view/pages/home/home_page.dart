import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/splash/splash_controller.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/home/parts/popmenu_user.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
            "Olá, ${_splashController.userModel!.profile!.typeString ?? 'Atualize seu perfil.'}.")),
        actions: [
          PopMenuButtonPhotoUser(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
