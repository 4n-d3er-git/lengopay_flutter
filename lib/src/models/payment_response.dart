class PaymentResponse {
  final String status;
  final String payId;
  final String paymentUrl;

  PaymentResponse({
    required this.status,
    required this.payId,
    required this.paymentUrl,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentResponse(
      status: json['status'],
      payId: json['pay_id'],
      paymentUrl: json['payment_url'],
    );
  }
}
