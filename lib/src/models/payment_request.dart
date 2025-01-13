class PaymentRequest {
  /// Votre websiteId
  final String websiteId;

  /// Le montant de la transaction
  final double amount;

  /// La devise de la transaction (ex: "GNF", "USD", "XOF")
  final String currency;

  /// Optionel l'URL de votre site web
  final String? returnUrl;

  /// Optionel votre URL de callback
  final String? callbackUrl;

  PaymentRequest({
    required this.websiteId,
    required this.amount,
    required this.currency,
    this.returnUrl,
    this.callbackUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'websiteid': websiteId,
      'amount': amount,
      'currency': currency,
      if (returnUrl != null) 'return_url': returnUrl,
      if (callbackUrl != null) 'callback_url': callbackUrl,
    };
  }
}
