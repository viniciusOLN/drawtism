import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigEmailController extends GetxController {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();

  void setEmailInformations() async {
    if (controllerEmail.text.isEmpty || controllerUsername.text.isEmpty) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("email", controllerEmail.text);
    await prefs.setString("username", controllerUsername.text);

    Get.toNamed("/mode");
  }
}
