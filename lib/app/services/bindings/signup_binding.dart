import 'package:get/get.dart';
import 'package:interni_project_one/app/services/controllers/auth_controllers.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
