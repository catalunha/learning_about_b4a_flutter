import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//
mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loading) {
    ever<bool>(loading, (value) async {
      if (value) {
        await Get.dialog(
          const Center(
            child: CircularProgressIndicator(),
          ),
          barrierDismissible: false,
          barrierColor: Colors.red.withAlpha(50),
        );
      } else {
        Get.back();
      }
    });
  }
}
