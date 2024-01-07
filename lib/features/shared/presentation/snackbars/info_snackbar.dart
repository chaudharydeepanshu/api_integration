import 'package:flutter/material.dart';
import 'package:api_integration/features/shared/presentation/snackbars/custom_snackbar.dart';
import 'package:api_integration/main.dart';

/// A custom snackbar used to show info.
ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showInfoSnackBar({
  required String text,
  String? subText,
}) {
  BuildContext? context = rootScaffoldMessengerKey.currentContext;

  if (context != null) {
    return showCustomSnackBar(
      text: text,
      subText: subText,
      iconData: Icons.info,
      iconAndTextColor: Colors.grey,
    );
  } else {
    return null;
  }
}
