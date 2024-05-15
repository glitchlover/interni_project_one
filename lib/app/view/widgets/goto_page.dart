import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interni_project_one/app/services/controllers/auth_controllers.dart';
import 'package:interni_project_one/core/enums/auth_state.dart';
import 'package:interni_project_one/core/routes/app_route.dart';

class GotoPage extends StatelessWidget {
  final String text;
  final String route;
  const GotoPage({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:
          Text(text, style: TextStyle(fontSize: 10, color: Colors.blue[900])),
      onTap: () {
        AuthController.instance.pageState = routeState[route]!;
        AuthController.instance.state.value = AuthState.none;
        Get.toNamed(route);
      },
    );
  }
}
