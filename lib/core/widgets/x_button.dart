import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promptme/core/theme/theme_color.dart';

class XButton extends StatelessWidget {
  ///Bouton arrondit, texte noir, background blanc, bordures transparentes ,  shadow: paramètre pour l'ombre
  factory XButton.whiteShadow({
    required String value,
    required void Function() onPressed,
    Widget? startIcon,
    Widget? endIcon,
    bool shadow = true,
    double? width,
    double? height,
    bool enabled = true,
    TextStyle? textStyle,
  }) {
    return XButton._(
      value: value.toUpperCase(),
      onPressed: onPressed,
      borderColor: Colors.transparent,
      textColor: Colors.black,
      shadow: shadow,
      startIcon: startIcon,
      endIcon: endIcon,
      background: white,
      height: height,
      width: width,
      enabled: enabled,
      textStyle: textStyle,
    );
  }

  ///Bouton arrondit, texte blanc, background blanc, bordures rouges ,  shadow: paramètre pour l'ombre
  factory XButton.redOutlinedShadow({
    required String value,
    required void Function() onPressed,
    Widget? startIcon,
    Widget? endIcon,
    bool shadow = true,
    double? width,
    double? height,
    bool enabled = true,
    TextStyle? textStyle,
  }) {
    return XButton._(
      value: value.toUpperCase(),
      onPressed: onPressed,
      borderColor: Colors.transparent,
      textColor: primary,
      shadow: shadow,
      startIcon: startIcon,
      endIcon: endIcon,
      background: white,
      height: height,
      width: width,
      enabled: enabled,
      textStyle: textStyle,
    );
  }

  ///Bouton carré, texte blanc, background blanc, bordures rouges
  factory XButton.redOutlinedRect({
    required String value,
    required void Function() onPressed,
    Widget? startIcon,
    Widget? endIcon,
    double? width,
    double? height,
    bool enabled = true,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8)),
    TextStyle? textStyle,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) {
    return XButton._(
      value: value,
      onPressed: onPressed,
      borderColor: primary,
      textColor: primary,
      startIcon: startIcon,
      endIcon: endIcon,
      background: Colors.transparent,
      height: height,
      width: width,
      enabled: enabled,
      borderRadius: borderRadius,
      textStyle: textStyle,
      padding: padding,
      margin: margin,
    );
  }

  ///Bouton arrondit, texte blanc, background blanc, bordures rouges
  factory XButton.redOutlined({
    required String value,
    required void Function() onPressed,
    Widget? startIcon,
    Widget? endIcon,
    double? width,
    double? height,
    bool enabled = true,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(90)),
    TextStyle? textStyle,
    EdgeInsets? padding,
  }) {
    return XButton._(
      value: value.toUpperCase(),
      onPressed: onPressed,
      borderColor: primary,
      textColor: primary,
      startIcon: startIcon,
      endIcon: endIcon,
      background: Colors.transparent,
      height: height,
      width: width,
      enabled: enabled,
      borderRadius: borderRadius,
      textStyle: textStyle,
      padding: padding,
    );
  }

  factory XButton.redFilled({
    required String value,
    required void Function() onPressed,
    double? width,
    double? height,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(90)),
    bool enabled = true,
    TextStyle? textStyle,
    EdgeInsets? padding,
  }) {
    return XButton._(
      value: value.toUpperCase(),
      onPressed: onPressed,
      borderColor: Colors.transparent,
      textColor: white,
      background: primary,
      height: height,
      width: width,
      borderRadius: borderRadius,
      enabled: enabled,
      textStyle: textStyle,
      padding: padding,
    );
  }

  factory XButton.whiteOutlined({
    required String value,
    required void Function() onPressed,
    Widget? startIcon,
    Widget? endIcon,
    double? width,
    double? height,
    bool enabled = true,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(90)),
    TextStyle? textStyle,
  }) {
    return XButton._(
      value: value.toUpperCase(),
      onPressed: onPressed,
      borderColor: white,
      textColor: white,
      startIcon: startIcon,
      endIcon: endIcon,
      background: Colors.transparent,
      height: height,
      width: width,
      enabled: enabled,
      borderRadius: borderRadius,
      textStyle: textStyle,
    );
  }

  factory XButton.blackOutlined({
    required String value,
    required void Function() onPressed,
    Widget? startIcon,
    Widget? endIcon,
    double? width,
    double? height,
    TextStyle? textStyle,
    bool enabled = true,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(20)),
  }) {
    return XButton._(
      value: value.toUpperCase(),
      onPressed: onPressed,
      borderColor: black1,
      textColor: black1,
      startIcon: startIcon,
      endIcon: endIcon,
      background: Colors.transparent,
      height: height,
      width: width,
      enabled: enabled,
      borderRadius: borderRadius,
      textStyle: textStyle,
    );
  }

  factory XButton.greyOutlined({
    required String value,
    required void Function() onPressed,
    Widget? startIcon,
    Widget? endIcon,
    double? width,
    double? height,
    TextStyle? textStyle,
    bool enabled = true,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(20)),
  }) {
    return XButton._(
      value: value.toUpperCase(),
      onPressed: onPressed,
      borderColor: grey8,
      textColor: grey8,
      startIcon: startIcon,
      endIcon: endIcon,
      background: Colors.transparent,
      height: height,
      width: width,
      enabled: enabled,
      borderRadius: borderRadius,
      textStyle: textStyle,
    );
  }

  ///Bouton arrondit , texte blanc , bordures transparentes
  factory XButton.greyFilled({
    required String value,
    required void Function() onPressed,
    double? width,
    double? height,
    TextStyle? textStyle,
    bool enabled = true,
  }) {
    return XButton._(
      value: value.toUpperCase(),
      onPressed: onPressed,
      borderColor: Colors.transparent,
      textColor: white,
      background: grey6,
      height: height,
      width: width,
      enabled: enabled,
      textStyle: textStyle,
    );
  }

  ///Bouton sans bordure , texte rouge
  factory XButton.noBorderRed({
    required String value,
    required void Function() onPressed,
    Widget? startIcon,
    Widget? endIcon,
    double? width,
    double? height,
    TextStyle? textStyle,
    bool enabled = true,
    double fontSize = 12,
  }) {
    return XButton._(
      value: value.toUpperCase(),
      onPressed: onPressed,
      textStyle: textStyle,
      borderColor: Colors.transparent,
      textColor: primary,
      startIcon: startIcon,
      endIcon: endIcon,
      background: white,
      height: height,
      width: width,
      enabled: enabled,
      fontSize: fontSize,
    );
  }

  ///Bouton sans bordure , texte gris
  factory XButton.noBorderGrey({
    required String value,
    required void Function() onPressed,
    Widget? startIcon,
    Widget? endIcon,
    double? width,
    double? height,
    TextStyle? textStyle,
    bool enabled = true,
    double fontSize = 12,
  }) {
    return XButton._(
      value: value.toUpperCase(),
      textStyle: textStyle,
      onPressed: onPressed,
      borderColor: Colors.transparent,
      textColor: grey5,
      startIcon: startIcon,
      endIcon: endIcon,
      background: white,
      height: height,
      width: width,
      enabled: enabled,
      fontSize: fontSize,
    );
  }

  ///Bouton faible arrondit , texte gris , bordures grises
  factory XButton.grey({
    required String value,
    required void Function() onPressed,
    Widget? startIcon,
    Widget? endIcon,
    double? width,
    double? height,
    TextStyle? textStyle,
    bool enabled = true,
  }) {
    return XButton._(
      value: value.toUpperCase(),
      onPressed: onPressed,
      borderColor: Colors.transparent,
      textColor: Colors.black,
      startIcon: startIcon,
      endIcon: endIcon,
      background: grey3,
      height: height,
      width: width,
      enabled: enabled,
      textStyle: textStyle,
    );
  }

  ///Bouton arrondit , texte noir , bordures noirs
  factory XButton.darkOutlined({
    required String value,
    required void Function() onPressed,
    double? width,
    double? height,
    bool enabled = true,
    TextStyle? textStyle,
    EdgeInsets? padding,
  }) {
    return XButton._(
      value: value.toUpperCase(),
      onPressed: onPressed,
      borderColor: Colors.black,
      textColor: Colors.black,
      height: height,
      width: width,
      enabled: enabled,
      textStyle: textStyle,
      padding: padding,
    );
  }

  const XButton._({
    required this.value,
    required this.onPressed,
    this.startIcon,
    this.endIcon,
    this.shadow = false,
    this.background,
    this.borderColor,
    this.width,
    this.height,
    this.textColor,
    this.enabled = true,
    this.borderRadius = const BorderRadius.all(Radius.circular(90)),
    this.fontSize = 14,
    this.textStyle,
    this.padding,
    this.margin,
  });

  /// Permet d'afficher les différents design des boutons
  /// ```
  ///   XButton.redOutlined(
  ///       required String value,
  ///       required void Function() onPressed,
  ///       double? width,
  ///       double? height,
  ///       bool enabled = true,
  ///   ),
  /// ```
  ///
  final String value;
  final void Function() onPressed;
  final Widget? startIcon;
  final Widget? endIcon;
  final bool shadow;
  final Color? background;
  final Color? borderColor;
  final double? width;
  final double? height;
  final Color? textColor;
  final bool enabled;
  final BorderRadius borderRadius;
  final double fontSize;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius,
      onTap: enabled ? onPressed : null,
      child: Container(
        width: width,
        height: height ?? 56,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        margin: margin,
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 1.2,
          ),
          borderRadius: borderRadius,
          boxShadow: [
            if (shadow)
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (startIcon != null) startIcon! else const SizedBox(),
            Text(
              value,
              style: textStyle ??
                  Get.textTheme.bodyText2!.copyWith(
                    color: textColor ?? white,
                  ),
            ),
            if (endIcon != null) endIcon! else const SizedBox(),
          ],
        ),
      ),
    );
  }
}
