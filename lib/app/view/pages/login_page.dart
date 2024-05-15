import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interni_project_one/app/services/controllers/auth_controllers.dart';
import 'package:interni_project_one/app/view/widgets/app_icon_and_text_button.dart';
import 'package:interni_project_one/app/view/widgets/app_text_field.dart';
import 'package:interni_project_one/app/view/widgets/auth_suggestor.dart';
import 'package:interni_project_one/app/view/widgets/email_field.dart';
import 'package:interni_project_one/app/view/widgets/goto_page.dart';
import 'package:interni_project_one/app/view/widgets/password_field.dart';
import 'package:interni_project_one/core/routes/app_route.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});


  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextField(label: "Enter username or email",
            controller: controller.usernameOrEmailTextController,),
            const SizedBox(height: 10,),
            PasswordField(controller: controller),
            const SizedBox(height: 80,),
      
            AppIconAndTextButton(
              label: "Log In", 
              icon: Icons.exit_to_app, 
              width: 150,
              onTap: () async => await controller.logIn(),
            ),
            const GotoPage(text: "New to the app? Sign up Now", route: AppPages.signup),
            AuthSuggestor(controller: controller)
          ]
        ),
      )
    );
  }
}