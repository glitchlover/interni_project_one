import 'package:get/get.dart';
import 'package:interni_project_one/app/services/controllers/dashboard_controllers.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}