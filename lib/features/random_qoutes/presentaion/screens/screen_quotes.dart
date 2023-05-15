import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes/config/routes/app_route.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/utils/assets_manager.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/core/utils/media_query_values.dart';
import 'package:quotes/core/widgets/error_widget.dart' as error_widget;
import 'package:quotes/features/favorite_qoutes/presentaion/screens/favorite_quotes.dart';
import 'package:quotes/features/random_qoutes/presentaion/cubit/random_quote_cubit.dart';
import 'package:quotes/features/random_qoutes/presentaion/cubit/random_quote_status.dart';
import 'package:quotes/features/random_qoutes/presentaion/widgets/quote_content.dart';
import 'package:toast/toast.dart';

import '../../domain/entities/quote.dart';

class ScreenQuotes extends StatefulWidget {
  @override
  _ScreenQuotesState createState() => _ScreenQuotesState();
}

class _ScreenQuotesState extends State<ScreenQuotes> {

  _getRandomQuote()=>BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  @override
  void initState() {
    _getRandomQuote();
  }
  Widget _buildBodyContent() {
    return BlocBuilder <RandomQuoteCubit, RandomQuoteState>(
        builder: (context, state) {
          if (state is RandomQuoteLoading) {
            return spinkit ;
          } else if (state is RandomQuoteLoaded){
          return LoadedQuotescreen(state.quote) ;
          }
          else if (state is RandomQuoteError){
          return const error_widget.ErrorWidget() ;
          }else
            return spinkit ;
          }
    );
  }
  final spinkit = SpinKitSquareCircle(
    color: AppColor.primary,

  );
  Widget LoadedQuotescreen(Quote quote) {
    return Column(children: [
       QuoteContent(quote: quote,),
      InkWell(
        onTap: ()=> _getRandomQuote(),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration:
          BoxDecoration(shape: BoxShape.circle, color: AppColor.primary),
          child: const Icon(
            Icons.refresh,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(AppStrings.appName),
    );
    return Scaffold(
      body: RefreshIndicator(child: Scaffold(appBar: appBar, body: _buildBodyContent()) , onRefresh:  _getRandomQuote(),));
  }
}
