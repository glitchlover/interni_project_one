import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:interni_project_one/app/services/bindings/dashboard_binding.dart';
import 'package:interni_project_one/app/services/bindings/login_binding.dart';
import 'package:interni_project_one/app/services/bindings/signup_binding.dart';
import 'package:interni_project_one/app/view/pages/dashboard_page.dart';
import 'package:interni_project_one/app/view/pages/login_page.dart';
import 'package:interni_project_one/app/view/pages/signup_page.dart';

class AppPages {
  AppPages._();

  static const initial = "/";
  static const signup = "/signup";
  static const login = "/login";
  static const dashboard = "/dashboard";

  static final routes = [
    GetPage(
      name: signup,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: initial,
      page: () => Container(),
    ),
  ];
}
