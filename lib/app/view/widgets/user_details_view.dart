import 'package:flutter/material.dart';
import 'package:interni_project_one/app/database/model/user_model.dart';
import 'package:interni_project_one/app/services/controllers/dashboard_controllers.dart';
import 'package:interni_project_one/app/view/widgets/app_icon_and_text_button.dart';

import 'user_editor_view.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView(
      {super.key, required this.controller, required this.userModel});

  final DashboardController controller;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Table(
            children: [
              tableRow("User Name: ", userModel.userName),
              tableRow("First Name: ", userModel.firstName),
              tableRow("Last Name: ", userModel.lastName),
              tableRow("Email: ", userModel.email),
              tableRow("Password: ", userModel.password),
            ],
          ),
          const SizedBox(height: 16.0),
          AppIconAndTextButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserEditorView(controller: controller),
                ),
              );
            },
            width: 200,
            label:"Edit User",
            icon: Icons.edit,
          ),
        ],
      ),
    );
  }

  TableRow tableRow(String label, dynamic value) {
    return TableRow(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 220, 225, 228), // Border for the cell
      ),
      children: [
        AppText(text: label),
        AppText(text: value),
    ]);
  }
}

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.blueGrey[700], fontSize: 24, fontWeight: FontWeight.w500),
      ),
    );
  }
}
