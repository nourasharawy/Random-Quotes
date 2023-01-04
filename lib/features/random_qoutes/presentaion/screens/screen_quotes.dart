import 'package:flutter/material.dart';
import 'package:quotes/config/routes/app_route.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/utils/assets_manager.dart';
import 'package:quotes/features/favorite_qoutes/presentaion/screens/favorite_quotes.dart';

class ScreenQuotes extends StatefulWidget {
  @override
  _ScreenQuotesState createState() => _ScreenQuotesState();
}

class _ScreenQuotesState extends State<ScreenQuotes> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: InkWell(
        onTap: ()=>Navigator.pushNamed(context, Routes.favouteQouteRoute),
        child: Center(child: Image.asset(
            ImgAssests.quote
        )),
      ),
    );
  }
}
