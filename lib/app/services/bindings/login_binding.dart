import 'package:get/get.dart';
import 'package:interni_project_one/app/view/pages/login_page.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginPage());
  }
}