class TransactionStatusRequest {
  /// Identifiant unique du paiement
  final String payId;

  /// Votre websiteId
  final String websiteId;

  TransactionStatusRequest({
    required this.websiteId,
    required this.payId,
  });

  Map<String, dynamic> toJson() {
    return {
      'pay_id': payId,
      'websiteid': websiteId,
    };
  }
}
