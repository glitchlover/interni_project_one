import 'package:flutter/material.dart';
import 'package:interni_project_one/app/services/controllers/dashboard_controllers.dart';
import 'package:interni_project_one/app/view/widgets/app_icon_and_text_button.dart';
import 'package:interni_project_one/app/view/widgets/app_text_field.dart';

class UserEditorView extends StatelessWidget {
  const UserEditorView({
    super.key,
    required this.controller,
  });

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AppTextField(
            controller: controller.userNameTextController,
            label: "Password",
          ),
          Spacer(),
          AppTextField(
            controller: controller.firstNameTextController,
            keyboardType: TextInputType.visiblePassword,
            label: "FirstName",
          ),
          Spacer(),
          AppTextField(
            controller: controller.lastNameTextController,
            keyboardType: TextInputType.visiblePassword,
            label: "Password",
          ),
          Spacer(),
          AppTextField(
            controller: controller.emailNameTextController,
            keyboardType: TextInputType.emailAddress,
            label: "Password",
          ),
          Spacer(),
          AppTextField(
            controller: controller.passwordNameTextController,
            keyboardType: TextInputType.visiblePassword,
            label: "Password",
          ),
          Spacer(flex: 100),
          Row(
            children: [
              AppIconAndTextButton(
                onTap: () {
                  controller.updateUser();
                  Navigator.pop(context);
                },
                icon: Icons.check,
                label: "Save Changes",
                width: 200,
              ),
              AppIconAndTextButton(
                onTap: () {
                  Navigator.pop(context);
                },
                icon: Icons.close,
                label: "Cancel",
                width: 200,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
