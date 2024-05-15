import 'package:flutter/material.dart';
import 'package:interni_project_one/app/services/controllers/auth_controllers.dart';
import 'package:interni_project_one/app/view/widgets/app_icon_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      onPressed: () {
        AuthController.instance.deleteAuth();
        Navigator.pop(context);
      },
      icon: Icons.logout,
      color: const Color.fromARGB(255, 75, 123, 172),
      padding: const EdgeInsets.all(20),
    ).paint();
  }
}
