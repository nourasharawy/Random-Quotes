import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/config/theme/app_theme.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({Key? key}) : super(key: key);

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
     ' “Success is a lousy teacher. It seduces smart people into thinking they can’t lose.”' ,
          textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1
          ),
         Container(child:  Text("Bill" ,  style: Theme.of(context).textTheme.bodyText1),
         margin: const EdgeInsets.symmetric(vertical: 15.0),),
        ],
      ),
    );
  }
}
