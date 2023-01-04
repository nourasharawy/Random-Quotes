import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/favorite_qoutes/presentaion/screens/favorite_quotes.dart';
import 'package:quotes/features/random_qoutes/presentaion/screens/screen_quotes.dart';

class Routes{
  static const String initialRoute = '/';
  static const String favouteQouteRoute  = '/favoriteQuote' ;
}

class AppRoutes{
  static Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context)=> ScreenQuotes()));

      case Routes.favouteQouteRoute:
        return MaterialPageRoute(builder: ((context)=> FavoriteQuotesScreen()));

      default:
        return undefindRoute();
    }
  }


  static Route<dynamic> undefindRoute(){
    return MaterialPageRoute(builder: (context) => const Scaffold(
      body: Center(
        child: Text(AppStrings.noRouteFound),
      ),
    ));
  }
}