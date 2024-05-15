import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interni_project_one/app/services/controllers/auth_controllers.dart';
import 'package:interni_project_one/core/enums/auth_state.dart';
import 'package:interni_project_one/core/routes/app_route.dart';
import '../widgets/app_text_field.dart';
import '../widgets/auth_suggestor.dart';
import '../widgets/email_field.dart';
import '../widgets/goto_page.dart';
import '../widgets/password_field.dart';
import '../widgets/submit_button.dart';

class SignUpPage extends GetView<AuthController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(40),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextField(
              label: "First Name",
              controller: controller.firstNameTextController,
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextField(
                label: "Last Name",
                controller: controller.lastNameTextController),
            const SizedBox(
              height: 10,
            ),
            EmailField(controller: controller),
            const SizedBox(
              height: 10,
            ),
            PasswordField(controller: controller),
            const SizedBox(
              height: 80,
            ),
            SubmitButton(controller: controller),
            const SizedBox(
              height: 20,
            ),
            const GotoPage(text: "Already have an account? Click here to login!",route: AppPages.login),
            AuthSuggestor(controller: controller),
          ]),
    ));
  }
}
