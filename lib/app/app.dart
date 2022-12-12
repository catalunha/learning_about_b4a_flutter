import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning About B4A',
      theme: ThemeData.dark(),
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      initialBinding: SplashDependencies(),
      getPages: Routes.pageList,
      initialRoute: Routes.splash,
    );
  }
}
