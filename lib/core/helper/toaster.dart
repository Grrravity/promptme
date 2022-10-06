import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promptme/core/theme/theme_color.dart';

const Duration _snackBarDisplayDuration = Duration(seconds: 4);

Widget _iconError = Padding(
  padding: const EdgeInsets.only(right: 20),
  child: Container(
    height: 20,
    width: 20,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(50),
    ),
    child: const Icon(
      Icons.close,
      size: 18,
      color: Colors.white,
    ),
  ),
);

Widget _iconSucces = Padding(
  padding: const EdgeInsets.only(right: 20),
  child: Container(
    height: 20,
    width: 20,
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(50),
    ),
    child: const Icon(
      Icons.check,
      size: 18,
      color: Colors.white,
    ),
  ),
);

class Toast extends SnackBar {
  const Toast._({
    required super.content,
    required super.duration,
    super.action,
    super.behavior,
    super.backgroundColor,
  });

  factory Toast.success({
    required String message,
    Duration duration = _snackBarDisplayDuration,
    SnackBarAction? action,
    Color backgroundColor = secondaryLight,
  }) {
    return Toast._(
      backgroundColor: backgroundColor,
      content: Row(
        children: [
          _iconSucces,
          Expanded(
            child: Text(
              message,
            ),
          ),
        ],
      ),
      duration: duration,
      action: action,
      behavior: SnackBarBehavior.fixed,
    );
  }

  factory Toast.error({
    required String message,
    Duration duration = _snackBarDisplayDuration,
    SnackBarAction? action,
    Color backgroundColor = secondaryLight,
  }) {
    return Toast._(
      backgroundColor: backgroundColor,
      content: Row(
        children: [
          _iconError,
          Expanded(
            child: Text(
              message,
            ),
          ),
        ],
      ),
      duration: duration,
      action: action,
      behavior: SnackBarBehavior.fixed,
    );
  }

  /// ```
  /// Toast.simple(
  ///   message: 'Ce modèle a bien été ajouté',
  ///   action: SnackBarAction(
  ///     label: 'ACCEDER',
  ///     onPressed: () {
  ///     },
  ///   ),
  /// ),
  /// ```
  factory Toast.simple({
    required String message,
    Duration duration = _snackBarDisplayDuration,
    SnackBarAction? action,
    Color backgroundColor = secondaryLight,
  }) {
    return Toast._(
      backgroundColor: backgroundColor,
      content: Text(
        message,
      ),
      duration: duration,
      action: action,
      behavior: SnackBarBehavior.fixed,
    );
  }

  /// ```
  /// Toast.showSnackBar(
  ///   context: context,
  ///   snackBar: Toast.simple(
  ///     message: 'Ce modèle a bien été ajouté',
  ///   ),
  /// );
  /// ```
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSnackBar({
    required BuildContext context,
    required SnackBar snackBar,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

void showToast({
  required bool isSuccess,
  required String message,
  SnackBarAction? action,
  Duration duration = _snackBarDisplayDuration,
  Color backgroundColog = secondaryLight,
}) {
  if (Get.context != null) {
    if (isSuccess) {
      Toast.showSnackBar(
        context: Get.context!,
        snackBar: Toast.success(
          message: message,
          action: action,
          duration: duration,
          backgroundColor: backgroundColog,
        ),
      );
    } else {
      Toast.showSnackBar(
        context: Get.context!,
        snackBar: Toast.error(
          message: message,
          action: action,
          duration: duration,
          backgroundColor: backgroundColog,
        ),
      );
    }
  }
}
