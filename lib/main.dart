import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interni_project_one/app/database/helper/database_helper.dart';
import 'package:interni_project_one/core/routes/app_route.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async{
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.signup,
      getPages: AppPages.routes,
    );
  }
}
