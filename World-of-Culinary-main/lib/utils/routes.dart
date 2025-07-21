import 'package:get/get.dart';
import 'package:recipe_app/views/categories.dart';
import 'package:recipe_app/views/dashboard.dart';
import 'package:recipe_app/views/login.dart';
import 'package:recipe_app/views/registration.dart';
import 'package:recipe_app/views/settings.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => const Login()),
    GetPage(name: "/registration", page: () => Home()),
    GetPage(name: "/dashboard", page: () => const Dashboard()),
    GetPage(name: "/categories", page: () => CategoriesCatalog()),
    GetPage(name: "/settings", page: () => const SettingsScreen())
  ];
}
