import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:currency_app/controllers/navigation_controller.dart';
import 'package:currency_app/screens/home_screen.dart';
import 'package:currency_app/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget getNavigationBar() {
  NavigationX cnx = Get.put(NavigationX());
  int currentIndex = 1;

  return Obx(() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.history_rounded),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: cnx.currentIndex.value,
      //backgroundColor: Colors.white30,

      //icons: [Icons.history_rounded, Icons.home, Icons.settings],
      onTap: (int) {
        currentIndex = int;
        switch (int) {
          case 1:
            cnx.getHomePage();
            break;
          case 2:
            cnx.getSettingsPage();
            break;
          default:
            cnx.getHomePage();
        }
      },
      //activeIndex: 0,
    );
  });
}
