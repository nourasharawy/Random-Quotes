import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/usecases/usecase.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_qoutes/domain/entities/quote.dart';
import 'package:quotes/features/random_qoutes/domain/usecases/get_random_quote.dart';
import 'package:quotes/features/random_qoutes/presentaion/cubit/random_quote_status.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState>{
  final GetRandomQuote getRandomQuoteUsecase ;

  RandomQuoteCubit({required this.getRandomQuoteUsecase}): super(RandomQuoteInitial());

  Future<void> getRandomQuote() async{
    Either <Failure , Quote > response = await getRandomQuoteUsecase(NoParams());

    emit(response.fold(
        (failure) =>RandomQuoteError(msg: _mapFailureToMsg(failure))  ,
        (quote)=> RandomQuoteLoaded(quote: quote)));
  }
String _mapFailureToMsg(Failure failure){
    switch (failure.runtimeType) {
        case ServerFailure:
          return AppStrings.serverFailure;
        case CasheFailure:
          return AppStrings.casheFailure;
      default:
        return AppStrings.unexpectedError;


}
  }

}