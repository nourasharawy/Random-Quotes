import 'package:flutter/material.dart';
import 'package:quotes/config/routes/app_route.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/utils/assets_manager.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/core/utils/media_query_values.dart';
import 'package:quotes/features/favorite_qoutes/presentaion/screens/favorite_quotes.dart';
import 'package:quotes/features/random_qoutes/presentaion/widgets/quote_content.dart';
import 'package:toast/toast.dart';

class ScreenQuotes extends StatefulWidget {
  @override
  _ScreenQuotesState createState() => _ScreenQuotesState();
}

class _ScreenQuotesState extends State<ScreenQuotes> {
  Widget _buildBodyContent() {
    return Column(children: [
       const QuoteContent(),
      Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: AppColor.primary),
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
          size: 28,
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(AppStrings.appName),
    );
    return Scaffold(appBar: appBar, body: _buildBodyContent());
  }
}
