import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interni_project_one/app/services/controllers/auth_controllers.dart';
import 'package:interni_project_one/app/view/widgets/app_text_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.controller,
  });

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppTextField(
        label: "Email",
        controller: controller.emailNameTextController,
        onChanged: (_) => controller.emailOnChange(),
        helperText: controller.emailHelper.value,
      );
    });
  }
}
