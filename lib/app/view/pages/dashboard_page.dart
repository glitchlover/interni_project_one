import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interni_project_one/app/services/controllers/dashboard_controllers.dart';
import 'package:interni_project_one/app/view/widgets/logout_button.dart';

import '../widgets/user_details_view.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEBEFF1),
        appBar: AppBar(
          title: const Text('User Details'),
          actions: const [LogoutButton()],
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: Obx(() {
          return UserDetailsView(
              userModel: controller.user.value, controller: controller);
        }));
  }
}
