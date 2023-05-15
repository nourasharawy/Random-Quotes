import 'package:equatable/equatable.dart';

import '../../domain/entities/quote.dart';

abstract class RandomQuoteState extends Equatable{
   const RandomQuoteState();
   @override
  List <Object> get props => [] ;
}

class RandomQuoteInitial extends RandomQuoteState{}

class RandomQuoteLoading extends RandomQuoteState{}


class RandomQuoteLoaded extends RandomQuoteState{
  final Quote quote ;

  RandomQuoteLoaded({required this.quote});

  List <Object> get props => [quote] ;
}

class RandomQuoteError extends RandomQuoteState{

  final String msg ;

  RandomQuoteError({required this.msg});

  List <Object> get props => [msg] ;
}