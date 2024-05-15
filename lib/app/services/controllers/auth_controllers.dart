import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interni_project_one/app/database/helper/database_helper.dart';
import 'package:interni_project_one/app/database/model/user_model.dart';
import 'package:interni_project_one/core/enums/auth_state.dart';
import 'package:interni_project_one/core/routes/app_route.dart';

class AuthController extends GetxController {
  static final AuthController instance = Get.put(AuthController());

  final Rx<AuthState> state = (AuthState.none).obs;
  PageState pageState = PageState.signup;

  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController emailNameTextController = TextEditingController();
  final TextEditingController passwordNameTextController =
      TextEditingController();
  final TextEditingController usernameOrEmailTextController =
      TextEditingController();

  final Rx<String> emailHelper = "".obs;
  final Rx<String> passwordHelper = "".obs;
  final Rx<IconData> passwordSuffix = Icons.key.obs;

  bool emailError = false;
  bool passwordError = false;
  bool hidePassword = true;

  bool get acceptedFirstName => firstNameTextController.text.isNotEmpty;
  bool get acceptedLastName => lastNameTextController.text.isNotEmpty;

  UserModel? userModel;

  @override
  void onInit() async {
    super.onInit();
    await _databaseHelper.initDB();
  }

  void passwordOnChange() {
    if (passwordNameTextController.text.length >= 5) {
      passwordError = false;
      passwordHelper.value = "";
      return;
    }
    passwordError = true;
    passwordHelper.value = "Password should be 5 character long";
  }

  void emailOnChange() {
    if (emailNameTextController.text.isEmail) {
      emailError = false;
      emailHelper.value = "";
      return;
    }
    emailError = true;
    emailHelper.value = "Make sure you typed an authentic email address";
    emailHelper.refresh();
  }

  Future<void> onSubmit() async {
    if (emailError ||
        passwordError ||
        !acceptedFirstName ||
        !acceptedLastName) {
      state.value = AuthState.inappropriateFillup;
      return;
    }
    String usernamegenerated =
        await _databaseHelper.generateUniqueUsername(firstName, lastName);
    userModel = UserModel(
        userName: usernamegenerated,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);

    if (await _databaseHelper.doesUserExist(userModel!.email)) {
      state.value = AuthState.sameUser;
      return;
    }
    await _databaseHelper.insert(userModel!);
    state.value = AuthState.loggedIn;
    pageState = PageState.dashboard;
    await Get.toNamed(AppPages.dashboard);
  }

  Future<void> logIn() async {
    if (emailError || passwordError) {
      state.value = AuthState.inappropriateFillup;
      return;
    }
    UserModel? u1 = await _databaseHelper.loginUser(
        usernameOrEmailTextController.text, password);
    if (u1 == null) {
      state.value = AuthState.failedLog;
      return;
    }
    Get.toNamed(AppPages.dashboard);
  }

  String get password => passwordNameTextController.text;

  String get email => emailNameTextController.text;

  String get lastName => lastNameTextController.text;

  String get firstName => firstNameTextController.text;

  void toggleSeePassword() {
    hidePassword = !hidePassword;
    passwordSuffix.value = (hidePassword ? Icons.key : Icons.key_off);
  }

  void deleteAuth() {
    userModel = null;
    firstNameTextController.text = "";
    lastNameTextController.text = "";
    emailNameTextController.text = "";
    passwordNameTextController.text = "";
  }
}
