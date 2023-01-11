import 'package:quotes/features/random_qoutes/data/models/quote_model.dart';


abstract class RandomQuoteRemoteDataSource{
  Future <QuoteModel> getRandomQuote();
}