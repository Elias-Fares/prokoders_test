import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showSnackBarMessage(BuildContext context,
    {required String message, bool isError = true}) {
  showTopSnackBar(
    Overlay.of(context),
    isError
        ? CustomSnackBar.error(
            message: message,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(5),
            textAlign: TextAlign.start,
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          )
        : CustomSnackBar.success(
            message: message,
            borderRadius: BorderRadius.circular(5),
            textAlign: TextAlign.start,
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
  );
}
