import 'package:api_integration/features/shared/presentation/snackbars/custom_snackbar.dart';
import 'package:api_integration/main.dart';
import 'package:flutter/material.dart';

/// A custom snackbar used to show success.
ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showWarningSnackBar({
  required String text,
  String? subText,
}) {
  BuildContext? context = rootScaffoldMessengerKey.currentContext;

  if (context != null) {
    return showCustomSnackBar(
      text: text,
      subText: subText,
      iconData: Icons.warning_rounded,
      duration: const Duration(seconds: 30),
      // Using custom colors.
      iconAndTextColor: Colors.orange,
    );
  } else {
    return null;
  }
}
