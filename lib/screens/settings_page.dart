import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:currency_app/controllers/theme_controller.dart';

import '../constants/text_styles.dart';
import '../widgets/bottom_navigation_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SwitchX sx = Get.put(SwitchX(), permanent: true);

    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      bottomNavigationBar: getNavigationBar(),
      body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text(
                      "${sx.themeName}",
                      style: settingsTextStyle,
                    )),
                Obx(
                  () => Switch(
                      onChanged: (val) => sx.toggle(), value: sx.on.value),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
