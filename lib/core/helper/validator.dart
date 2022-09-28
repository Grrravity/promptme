import 'package:get/get.dart';

class ValidatorMixin {
  String? requiredEmailValidation(String? value) {
    const emailFormat =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final regExpEmail = RegExp(emailFormat);
    if (value == null || value.isEmpty) {
      return 'Email requis'.tr;
    } else if (!regExpEmail.hasMatch(value)) {
      return "Format de l'email invalide (ex: exemple@google.fr)";
    }
    return null;
  }

  String? optionalEmailValidation(String? value) {
    const emailFormat =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final regExpEmail = RegExp(emailFormat);
    if (value == null || value.isEmpty) {
      return null;
    } else if (!regExpEmail.hasMatch(value)) {
      return "Format de l'email invalide (ex: exemple@google.fr)";
    }
    return null;
  }

  String? tooShort(String value, int maxLength, {String? prefixMessage}) {
    if (value.length < maxLength) {
      return '${prefixMessage ?? 'Champs'} trop court (min $maxLength)';
    }
    return null;
  }

  String? tooLong(String value, int maxLength, {String? prefixMessage}) {
    if (value.length > maxLength) {
      return '${prefixMessage ?? 'Champs'} trop long (max $maxLength)';
    }
    return null;
  }

  String? isNotEmpty(String? value, {String? prefixMessage}) {
    if (value == null || value.isEmpty) {
      return "${prefixMessage ?? 'Champs'} requis";
    }
    return null;
  }

  String? fieldValidatorNotEmpty(String? value) {
    String? invalid;
    invalid = isNotEmpty(value);
    if (invalid != null) {
      return invalid;
    }
    invalid = tooShort(value!, 4);
    if (invalid != null) {
      return invalid;
    }
    return null;
  }
}
