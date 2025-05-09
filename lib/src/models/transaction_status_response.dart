class TransactionStatusResponse {
  final String status;
  final String payId;
  final String date;
  final int amount;
  TransactionStatusResponse({
    required this.status,
    required this.payId,
    required this.date,
    required this.amount,
  });

  factory TransactionStatusResponse.fromJson(Map<String, dynamic> json) {
    return TransactionStatusResponse(
      status: json['status'],
      payId: json['pay_id'],
      date: json['date'],
      amount: json['amount'],
    );
  }
}
