import 'package:flutter/material.dart';
import 'package:interni_project_one/app/services/controllers/auth_controllers.dart';
import 'package:interni_project_one/app/view/widgets/app_icon_and_text_button.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.controller,
  });

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return AppIconAndTextButton(
      label: "Submit",
      icon: Icons.exit_to_app,
      width: 150,
      onTap: () async => await controller.onSubmit(),
    );
  }
}
