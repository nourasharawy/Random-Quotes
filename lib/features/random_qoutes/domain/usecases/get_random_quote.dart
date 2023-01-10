import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/usecases/usecase.dart';
import 'package:quotes/features/random_qoutes/domain/entities/quote.dart';
import 'package:quotes/features/random_qoutes/domain/repoistories/quote_repoistory.dart';

class GetRandomQuote implements UseCase<Quote, NoParams>{
  final QuoteRepoistory quoteRepoistory ;

  GetRandomQuote({ required this.quoteRepoistory});


  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
     quoteRepoistory.getRandomQuote();

}