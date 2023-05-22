import 'package:daily_space/common/routes/app_pages.dart';
import 'package:daily_space/configs/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/source/local/local_datasource.dart';


void main()async {
  // WidgetsFlutterBinding.ensureInitialized();
  await LocalDataSource.initialize();
  runApp(const DailyApp());
}

class DailyApp extends StatelessWidget {
  const DailyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var isDark = Get.isDarkMode;
    print("当前是暗黑主题:$isDark");
    return GetMaterialApp(
      color: Colors.white,
      themeMode: ThemeMode.light,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      initialRoute: AppPages.initialPage,
      getPages: AppPages.routes,
    );
  }
}
