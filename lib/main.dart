import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_authentication/app/config/routes/app_pages.dart';
import 'package:google_authentication/app/config/themes/app_basic_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.initial,
      title: 'Google Authentication',
      theme: AppBasicTheme.getThemeData(),
      getPages: AppPages.routes,
    );
  }
}