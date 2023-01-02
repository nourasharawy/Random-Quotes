import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_strings.dart';

class ScreenQuotes extends StatefulWidget {
  @override
  _ScreenQuotesState createState() => _ScreenQuotesState();
}

class _ScreenQuotesState extends State<ScreenQuotes> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text(AppStrings.appName)),
    );
  }
}
