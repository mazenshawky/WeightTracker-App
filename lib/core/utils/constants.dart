import 'package:flutter/material.dart';
import 'package:weight_tracker/core/utils/app_colors.dart';

class Constants {
  static late String initialRoute;

  static void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.kPrimaryColor),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) => alertDialog,
    );
  }

  static void showSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: AppColors.kPrimaryColor),
        ),
        backgroundColor: AppColors.kPrimaryLightColor,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
