/// Modèle pour les détails du callback
class CallbackDetails {
  final String payId;
  final String status;
  final double amount;
  final String message;
  final String? client;

  CallbackDetails({
    required this.payId,
    required this.status,
    required this.amount,
    required this.message,
    this.client,
  });

  factory CallbackDetails.fromJson(Map<String, dynamic> json) {
    return CallbackDetails(
      payId: json['pay_id'],
      status: json['status'],
      amount: json['amount'].toDouble(),
      message: json['message'],
      client: json['Client'],
    );
  }
}
