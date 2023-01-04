import 'package:flutter/material.dart';
import 'package:quotes/config/routes/app_route.dart';
import 'package:quotes/core/utils/app_strings.dart';

import 'config/theme/app_theme.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
