import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/features/random_qoutes/domain/entities/quote.dart';

abstract class QuoteRepoistory {
  Future<Either<Failure, Quote>> getRandomQuote();
}