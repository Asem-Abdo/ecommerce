import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(message, style: AppStyles.medium18Header),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    {
      List<Widget> actions = [];
      if (posActionName != null) {
        actions.add(
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              posAction?.call();
            },
            child: Text(posActionName, style: AppStyles.medium14PrimaryDark),
          ),
        );
      }
      if (negActionName != null) {
        actions.add(
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              negAction?.call();
            },
            child: Text(negActionName, style: AppStyles.medium14PrimaryDark),
          ),
        );
      }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message, style: AppStyles.regular14Text),
            title: title != null
                ? Text(title, style: AppStyles.medium18Header)
                : null,
            actions: actions,
          );
        },
      );
    }
  }
}
