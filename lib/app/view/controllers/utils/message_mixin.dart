import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessageMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model.isError ? Colors.red : Colors.blue,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 5),
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final bool isError;
  MessageModel({
    required this.title,
    required this.message,
    this.isError = false,
  });
}
