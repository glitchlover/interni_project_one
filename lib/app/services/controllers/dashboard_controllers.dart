import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interni_project_one/app/database/helper/database_helper.dart';
import 'package:interni_project_one/app/database/model/user_model.dart';
import 'package:interni_project_one/app/services/controllers/auth_controllers.dart';

class DashboardController extends GetxController {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final TextEditingController userNameTextController = TextEditingController();
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController emailNameTextController = TextEditingController();
  final TextEditingController passwordNameTextController =
      TextEditingController();

  late Rx<UserModel> user;

  UserModel getUser() => UserModel(
      userName: userNameTextController.text,
      firstName: firstNameTextController.text,
      lastName: lastNameTextController.text,
      email: emailNameTextController.text,
      password: passwordNameTextController.text);

  @override
  void onInit() async {
    super.onInit();
    user = AuthController.instance.userModel!.obs;
    await _databaseHelper.initDB();
    initializeFields();
  }

  void initializeFields() {
    userNameTextController.text = user.value.userName;
    firstNameTextController.text = user.value.firstName;
    lastNameTextController.text = user.value.lastName;
    passwordNameTextController.text = user.value.password;
    emailNameTextController.text = user.value.email;
  }

  void updateUser() {
    _databaseHelper.update(getUser());
    user.value = getUser();
    AuthController.instance.userModel = getUser();
    update();
  }
}
