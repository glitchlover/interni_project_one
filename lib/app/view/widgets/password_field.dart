import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interni_project_one/app/services/controllers/auth_controllers.dart';
import 'package:interni_project_one/app/view/widgets/app_text_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.controller,
  });

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppTextField(
        label: "Password",
        controller: controller.passwordNameTextController,
        onChanged: (_) => controller.passwordOnChange(),
        obscureText: controller.hidePassword,
        suffix: controller.passwordSuffix.value,
        onSuffixPressed: () => controller.toggleSeePassword(),
        helperText: controller.passwordHelper.value,
      );
    });
  }
}
