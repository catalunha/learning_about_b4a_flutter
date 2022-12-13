import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Image.asset(
          //   AppAssets.b4aLogo,
          //   // height: 200,
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          Text('Analisando seus dados...'),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(),
        ],
      ),
    ));
  }
}
