import 'dart:convert';

import 'package:quotes/core/api/end_point.dart';
import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_qoutes/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomQuoteRemoteDataSource{
  Future <QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource{
  http.Client client;

  RandomQuoteRemoteDataSourceImpl({required this.client});
  @override
  Future<QuoteModel> getRandomQuote() async{
    final randomQuoteUri = Uri.parse(EndPoints.randomQuote);
    final response =await client.get(randomQuoteUri ,headers: {AppStrings.contentType : AppStrings.applicationJson});
    if(response.statusCode == 200){
      return QuoteModel.fromJson(json.decode(response.body));
    }else{
      throw ServerException();
    }

  }
}