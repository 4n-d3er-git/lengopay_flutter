import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants/api_constants.dart';
import 'models/payment_request.dart';
import 'models/payment_response.dart';
import 'exceptions/lengopay_exception.dart';
import 'utils/validators.dart';

class LengopayFlutter {
  final String baseUrl;
  final String licenseKey;

  /// Par defaut le package utilise l'url de test: 'https://sandbox.lengopay.com/api/v1'
  /// Optionnel: utilisez l'URL de production
  /// baseUrl: 'https://portal.lengopay.com/api/v1',
  LengopayFlutter({
    String? baseUrl,
    required this.licenseKey,
  }) : baseUrl = baseUrl ?? ApiConstants.sandboxBaseUrl;

  Future<PaymentResponse> initiatePayment(PaymentRequest request) async {
    if (!Validators.isValidAmount(request.amount)) {
      throw LengopayException('Montant invalide');
    }

    if (!Validators.isValidCurrency(request.currency)) {
      throw LengopayException('Devise non supportée');
    }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/payments'),
        headers: {
          ...ApiConstants.headers,
          'Authorization': 'Basic $licenseKey',
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        return PaymentResponse.fromJson(jsonDecode(response.body));
      }

      throw LengopayException(
        'Erreur lors de la requête',
        statusCode: response.statusCode,
      );
    } catch (e) {
      if (e is LengopayException) rethrow;
      throw LengopayException('Une erreur inattendue est survenue: $e');
    }
  }
}
