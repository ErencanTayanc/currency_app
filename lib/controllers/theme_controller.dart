import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SwitchX extends GetxController {
  RxBool on = false.obs; // our observable
  RxString themeName = "Light Mode".obs;
  void toggle() {
    on.value = on.value ? false : true;
    themeName.value = on.value ? "Dark Mode" : "Light Mode";
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  }
}
