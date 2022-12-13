import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/splash/splash_dependencies.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/user/login/login_dependencies.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/user/register/email/user_register_email_dependencies.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/splash/splash_page.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/user/login/auth_login_page.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/user/register/email/user_register_email.page.dart';

class Routes {
  static const splash = '/';

  static const userLogin = '/user/login';

  static const userRegisterEmail = '/user/register/email';

  static const home = '/home';

  static const profile = '/user/profile';

  static const genreAddEdit = '/genre/addedit';
  static const genreList = '/genre/list';

  static final pageList = [
    GetPage(
      name: Routes.splash,
      binding: SplashDependencies(),
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.userLogin,
      binding: AuthLoginDependencies(),
      page: () => AuthLoginPage(),
    ),
    GetPage(
      name: Routes.userRegisterEmail,
      binding: UserRegisterEmailDependencies(),
      page: () => AuthRegisterEmailPage(),
    ),
    // GetPage(
    //   name: Routes.genreAddEdit,
    //   binding: GenreAddEditDependencies(),
    //   page: () => GenreAddEditPage(),
    // ),
    // GetPage(
    //   name: Routes.genreList,
    //   binding: GenreSearchDependencies(),
    //   page: () => GenreSearchListPage(),
    // ),
  ];
}
