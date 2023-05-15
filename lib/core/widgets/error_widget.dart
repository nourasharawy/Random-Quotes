import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ErrorWidget extends StatelessWidget {
  final VoidCallback? onPress ;

  const ErrorWidget({super.key,  this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning_amber_outlined,
            color: AppColor.primary,
            size: 150,
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Text("Something went error" ,
            style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
              fontSize: 20
          ),),
        ),
        Text("Please try again" ,
          style: TextStyle(
              color: AppColor.hint,
              fontWeight: FontWeight.w500,
              fontSize: 18
          ),),
        ElevatedButton(onPressed: (){
          if(onPress != null){
            onPress!();
          }
        }, child: Text("Reload Screen"), style: ElevatedButton.styleFrom(
          primary: AppColor.primary
        ),)
      ],
    );
  }
}
