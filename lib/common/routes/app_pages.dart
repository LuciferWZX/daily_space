import 'package:daily_space/ui/screens/home/index.dart';
import 'package:daily_space/pages/welcome/index.dart';
import 'package:daily_space/ui/screens/poke_dex/index.dart';
import 'package:get/get.dart';

part 'app_routes.dart';
class AppPages{
  static const initialPage = AppRoutes.home;
  static final routes = [
    GetPage(name: AppRoutes.welcome, page: ()=>WelcomeView()),
    GetPage(name: AppRoutes.home, page: ()=>HomeView()),
    GetPage(name: AppRoutes.pokeDex, page: ()=>PokeDexView())
  ];
}