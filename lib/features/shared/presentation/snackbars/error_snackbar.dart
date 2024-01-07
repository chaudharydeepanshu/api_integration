import 'package:flutter/material.dart';
import 'package:api_integration/features/shared/presentation/snackbars/custom_snackbar.dart';
import 'package:api_integration/main.dart';

/// A custom snackbar used to show errors.
ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showErrorSnackBar({
  required String text,
  String? subText,
}) {
  ScaffoldMessengerState? scaffold = rootScaffoldMessengerKey.currentState;

  if (scaffold != null) {
    BuildContext context = scaffold.context;

    final ThemeData theme = Theme.of(context);

    return showCustomSnackBar(
      text: text,
      subText: subText,
      iconData: Icons.cancel,
      iconAndTextColor: theme.colorScheme.error,
      duration: const Duration(seconds: 30),
      action: SnackBarAction(
        backgroundColor: theme.colorScheme.onInverseSurface,
        textColor: theme.colorScheme.inverseSurface,
        label: 'Ok',
        onPressed: () {
          rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
        },
      ),
    );
  } else {
    return null;
  }
}
