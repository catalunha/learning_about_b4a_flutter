import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/home/home_controller.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/splash/splash_controller.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/home/parts/popmenu_user.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/utils/app_assets.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _splashController = Get.find<SplashController>();
  final _homeController = Get.find<HomeController>();

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
          children: [
            Image.asset(
              AppAssets.dbRelation,
              // height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            table('Table Genre', _homeController.genreRepository,
                _homeController.genreSearch),
            table('Table Author', _homeController.authorRepository,
                _homeController.authorSearch),
            table('Table Shape', _homeController.shapeRepository,
                _homeController.shapeSearch),
            table('Table Publisher', _homeController.publisherRepository,
                _homeController.publisherSearch),
            table('Table Book', _homeController.bookRepository,
                _homeController.bookSearch),
          ],
        ),
      ),
    );
  }

  Widget table(String text, Function()? repo, Function()? search) {
    return Card(
      child: Column(
        children: [
          Text(text),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: repo, icon: const Icon(Icons.edit)),
              IconButton(onPressed: search, icon: const Icon(Icons.list))
            ],
          )
        ],
      ),
    );
  }
}
