import 'package:get/get.dart';

class Routes {
  static const splash = '/';

  static const userLogin = '/user/login';

  static const userRegisterEmail = '/user/register/email';

  static const home = '/home';

  static const profile = '/user/profile';

  static const genreAddEdit = '/genre/addedit';
  static const genreSearch = '/genre/search';
  static const genreList = '/expect/list';

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
    GetPage(
      name: Routes.genreAddEdit,
      binding: GenreAddEditDependencies(),
      page: () => GenreAddEditPage(),
    ),
    GetPage(
      name: Routes.genreList,
      binding: GenreSearchDependencies(),
      page: () => GenreSearchListPage(),
    ),
  ];
}
