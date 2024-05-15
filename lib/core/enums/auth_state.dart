import 'package:interni_project_one/core/routes/app_route.dart';

enum PageState { signup, login, dashboard }

enum AuthState { loggedIn, sameUser, logging, inappropriateFillup, none, failedLog }

Map<AuthState, String?> authStateSuggestion = {
  AuthState.loggedIn: null,
  AuthState.sameUser: "You have logged in before",
  AuthState.logging: null,
  AuthState.inappropriateFillup: "Fillup the form correctly",
  AuthState.none: null,
  AuthState.failedLog: "Sorry, information didn't matched"
};

Map<String, PageState> routeState = {
  AppPages.signup: PageState.signup,
  AppPages.login: PageState.login,
  AppPages.dashboard: PageState.dashboard
};
