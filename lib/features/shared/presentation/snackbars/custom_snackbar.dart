import 'package:flutter/material.dart';
import 'package:api_integration/main.dart';

/// Custom SnackBar which is used through out the app.
ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showCustomSnackBar({
  required String text,
  String? subText,
  Duration? duration,
  IconData? iconData,
  Color? iconAndTextColor,
  SnackBarAction? action,
}) {
  rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();

  BuildContext? context = rootScaffoldMessengerKey.currentState?.context;

  if (context != null && context.mounted) {
    final ThemeData theme = Theme.of(context);

    return rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: ListView(
          shrinkWrap: true,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  iconData ?? Icons.info,
                  color: iconAndTextColor ?? theme.colorScheme.onInverseSurface,
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          text,
                          softWrap: true,
                          textAlign: TextAlign.start,
                          style: iconAndTextColor != null
                              ? const TextStyle()
                                  .copyWith(color: iconAndTextColor)
                              : null,
                        ),
                      ),
                      subText != null
                          ? Flexible(
                              child: Text(
                                subText,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onInverseSurface,
                                ),
                                softWrap: true,
                                textAlign: TextAlign.start,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: theme.colorScheme.inverseSurface.withOpacity(0.9),
        duration: duration ?? const Duration(seconds: 4),
        action: action,
      ),
    );
  } else {
    return null;
  }
}
