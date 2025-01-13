class LengopayException implements Exception {
  final String message;
  final int? statusCode;

  LengopayException(this.message, {this.statusCode});

  @override
  String toString() => 'LengopayException: $message (Code: $statusCode)';
}
