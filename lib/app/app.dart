import 'package:flutter/material.dart';
import 'package:weight_tracker/core/utils/app_strings.dart';
import 'package:weight_tracker/core/utils/constants.dart';

import '../config/routes/app_routes.dart';
import '../config/themes/app_themes.dart';

class WeightsApp extends StatelessWidget {
  const WeightsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: getApplicationTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: Constants.initialRoute,
    );
  }
}
