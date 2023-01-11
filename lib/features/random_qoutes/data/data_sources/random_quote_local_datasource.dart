import 'package:quotes/features/random_qoutes/data/models/quote_model.dart';

abstract class RandomQuoteLocalDataSource{
  Future <QuoteModel> getLastRandomQuote();
  Future <void> casheQuote(QuoteModel quote);
}