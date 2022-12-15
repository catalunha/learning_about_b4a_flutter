import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/splash/splash_controller.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/utils/app_assets.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  var splashController = Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Bem vindo ao '),
          const Text('Learning about back4app em Flutter'),
          const SizedBox(height: 20),
          Image.asset(
            AppAssets.b4aLogo,
            // height: 200,
          ),
          const SizedBox(height: 20),
          const Text('Analisando seus dados...'),
          const SizedBox(
            height: 20,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    ));
  }
}
