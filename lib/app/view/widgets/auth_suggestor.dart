import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interni_project_one/app/services/controllers/auth_controllers.dart';
import 'package:interni_project_one/core/enums/auth_state.dart';

class AuthSuggestor extends StatelessWidget {
  const AuthSuggestor({
    super.key,
    required this.controller,
  });

  final AuthController controller;

  String get suggestor => authStateSuggestion[controller.state.value] ?? "";

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(suggestor,
        style: TextStyle(
          color: Colors.red[400],
          fontWeight: FontWeight.bold,
        )));
  }
}
