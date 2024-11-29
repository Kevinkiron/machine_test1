import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

class Constants {
  static double width = 0;
  static double height = 0;
}

void toastmsg(String msg) {
  Fluttertoast.showToast(
    fontSize: 12,
    msg: msg,
    backgroundColor: AppColors.green,
    textColor: AppColors.backgroundColor,
  );
}

void toastmsgTop(String msg) {
  Fluttertoast.showToast(
    gravity: ToastGravity.CENTER,
    fontSize: 12,
    msg: msg,
    backgroundColor: AppColors.green,
    textColor: AppColors.backgroundColor,
  );
}

void errortoastmsg(String msg) {
  Fluttertoast.showToast(
    fontSize: 12,
    msg: msg,
    backgroundColor: AppColors.red,
    textColor: AppColors.backgroundColor,
  );
}

void errormsg(String msg) {
  Fluttertoast.showToast(
      fontSize: 12,
      msg: msg,
      backgroundColor: AppColors.red,
      gravity: ToastGravity.CENTER,
      textColor: AppColors.backgroundColor);
}

void credentialtoastmsg() {
  Fluttertoast.showToast(
      fontSize: 12,
      msg: "All Credentials Are Mandatory",
      backgroundColor: AppColors.red,
      textColor: AppColors.backgroundColor);
}
