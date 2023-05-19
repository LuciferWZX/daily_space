import 'package:daily_space/configs/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController{
  RxBool isDark = false.obs;
  void toggleTheme(){
    isDark.value = !isDark.value;
    Get.changeThemeMode(Get.isDarkMode?ThemeMode.light:ThemeMode.dark);
    update();
  }
}