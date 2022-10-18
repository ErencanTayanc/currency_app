import 'package:currency_app/screens/home_screen.dart';
import 'package:currency_app/screens/settings_page.dart';
import 'package:get/get.dart';

class NavigationX extends GetxController {
  var currentIndex = 1.obs; // our observable

  void getHomePage() {
    currentIndex.value = 1;
    Get.off(const HomeScreen(), arguments: true);
  }

  void getSettingsPage() {
    currentIndex.value = 2;
    Get.off(const SettingsScreen(), arguments: true);
  }
}
