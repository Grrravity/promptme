import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promptme/core/routes/routes_export.dart';
import 'package:promptme/core/theme/theme.dart';

void main() async {
  runApp(const PromptMeApp());
}

class PromptMeApp extends StatelessWidget {
  const PromptMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Prompt Me',
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      initialRoute: Routes.initialRoute,
      getPages: Nav.routes,
      defaultTransition: Transition.noTransition,
      theme: myTheme,
      darkTheme: myDarktheme,
      themeMode: ThemeMode.light,
    );
  }
}
