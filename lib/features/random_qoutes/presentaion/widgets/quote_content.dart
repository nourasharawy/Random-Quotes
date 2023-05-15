import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/config/theme/app_theme.dart';

import '../../domain/entities/quote.dart';

class QuoteContent extends StatelessWidget {
  final Quote quote ;

  const QuoteContent({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(30.0)),
      child: Column(
        children:  [
           Text(
     quote.content ,
          textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1
          ),
         Container(child:  Text(quote.author ,  style: Theme.of(context).textTheme.bodyText1),
         margin: const EdgeInsets.symmetric(vertical: 15.0),),
        ],
      ),
    );
  }
}
