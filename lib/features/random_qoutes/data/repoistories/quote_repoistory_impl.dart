import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/features/random_qoutes/data/data_sources/random_quote_local_datasource.dart';
import 'package:quotes/features/random_qoutes/data/data_sources/random_quote_remote_datasource.dart';
import 'package:quotes/features/random_qoutes/domain/entities/quote.dart';
import 'package:quotes/features/random_qoutes/domain/repoistories/quote_repoistory.dart';

class QuoteRepoistoryImpl implements QuoteRepoistory{
  final NetworkInfo networkInfo ;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;


  QuoteRepoistoryImpl({
  required this.networkInfo,
  required this.randomQuoteRemoteDataSource,
  required this.randomQuoteLocalDataSource});

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async{
    if(await networkInfo.isConnected){
        try{
          final remoteRandomQoute = await randomQuoteRemoteDataSource.getRandomQuote();
          randomQuoteLocalDataSource.casheQuote(remoteRandomQoute);
          return Right(remoteRandomQoute);
        }on ServerException{
          return Left(ServerFailure());
        }
    }else{
      try{
        final casheRandomQoute = await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(casheRandomQoute);
      }on CasheException{
        return Left(CasheFailure());
      }
    }
  }

}