import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/config/routes/app_route.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/assets_manager.dart';
import 'package:quotes/core/utils/media_query_values.dart';

import 'package:toast/toast.dart';

class Constants {
  ///////////////////////////////////////////////////////////////////////////////////
  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                msg,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Ok"),
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                )
              ],
            ));
  }

  ///////////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////////////////////////////////////////////////////////
  // don't forget : ToastContext().init(context);
  static void showToast(
      {required String msg, Color? color, int? gravity, int? duration}) {
    Toast.show(msg,
        gravity: gravity ?? Toast.bottom,
        backgroundColor: color ?? AppColor.primary,
        duration: duration ?? Toast.lengthLong);
  }
  ///////////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////////////////////////////////////////////////////////
  //calling : Constants.inkwellOption(context),
  static inkwellOption(BuildContext context) {
    return InkWell(
      onTap: () => Constants.showErrorDialog(context: context, msg: "Erorr"),
      onLongPress: () => Constants.showToast(msg: "Toast"),
      onDoubleTap: () => Navigator.pushNamed(context, Routes.favouteQouteRoute),
      child: Center(
          child: Image.asset(
        ImgAssests.quote,
        width: context.width,
      )),
    );
  }
}
///////////////////////////////////////////////////////////////////////////////////
