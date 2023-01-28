
import 'dart:convert';

import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_qoutes/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDataSource{
  Future <QuoteModel> getLastRandomQuote();
  Future <void> casheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource{
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString = sharedPreferences.getString(
        AppStrings.cashedRandomQoute);
    if (jsonString != null) {
       final casheRandomQoute = Future.value(QuoteModel.fromJson(json.decode(jsonString)));
       return casheRandomQoute ;
    } else {
      throw CasheException();
    }
  }
  @override
  Future<void> casheQuote(QuoteModel quote) {
   return sharedPreferences.setString(AppStrings.cashedRandomQoute , json.encode(quote));
  }



}