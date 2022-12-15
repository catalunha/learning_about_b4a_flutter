import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/home/home_dependencies.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/splash/splash_dependencies.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/user/login/user_login_dependencies.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/user/profile/user_profile_dependencies.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/user/register/email/user_register_email_dependencies.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/home/home_page.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/splash/splash_page.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/user/login/user_login_page.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/user/profile/user_profile_page.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/user/register/email/user_register_email.page.dart';

class Routes {
  static const splash = '/';

  static const userLogin = '/user/login';

  static const userRegisterEmail = '/user/register/email';

  static const home = '/home';

  static const userProfile = '/user/profile';

  static final pageList = [
    GetPage(
      name: Routes.splash,
      binding: SplashDependencies(),
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.userLogin,
      binding: UserLoginDependencies(),
      page: () => UserLoginPage(),
    ),
    GetPage(
      name: Routes.userRegisterEmail,
      binding: UserRegisterEmailDependencies(),
      page: () => UserRegisterEmailPage(),
    ),
    GetPage(
      name: Routes.home,
      binding: HomeDependencies(),
      page: () => HomePage(),
      children: const [],
    ),
    GetPage(
      name: Routes.userProfile,
      binding: UserProfileDependencies(),
      page: () => UserProfilePage(),
    ),
  ];
}
