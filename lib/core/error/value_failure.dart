class ValueFailure<T> {
  ValueFailure({required this.message, this.details});
  final T message;
  final T? details;

  @override
  String toString() => 'message: $message, detail: $details';
}
