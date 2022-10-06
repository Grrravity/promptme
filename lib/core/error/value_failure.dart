import 'package:flutter/foundation.dart';

class ValueFailure<T> extends Error {
  ValueFailure({required this.message, this.details});
  final T message;
  final T? details;

  @override
  String toString() =>
      '$message${details != null && kDebugMode ? ' -- detail: $details' : ''}';
}
