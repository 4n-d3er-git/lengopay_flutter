import 'dart:developer';
import 'package:lengopay_flutter/lengopay_flutter.dart';
import 'package:flutter/material.dart';

void main() => runApp(const LengoPayApp());

class LengoPayApp extends StatefulWidget {
  const LengoPayApp({super.key});

  @override
  State<LengoPayApp> createState() => _LengoPayAppState();
}

class _LengoPayAppState extends State<LengoPayApp> {
  String output = 'Cliquez sur le bouton pour tester le paiement.';

  Future<void> testPayment() async {
    // Initialisation du service Lengopay avec votre clé de licence
    final lengopay = LengopayFlutter(
      // Clé de licence obtenue sur votre compte Lengopay
      licenseKey: 'VOTRE_LICENSE_KEY',

      // Par defaut le package utilise l'url de test: 'https://sandbox.lengopay.com/api/v1'
      // vous pouvez utiliser l'URL de production
      // ici 👇👇
      // baseUrl:
    );

    try {
      // Initier un paiement
      final paymentResponse = await lengopay.initiatePayment(
        PaymentRequest(
          websiteId: 'VOTRE_WEBSITE_ID',
          // L'identifiant unique de votre site
          amount: 1500,
          // Montant du paiement
          currency: 'GNF',
          // Devise utilisée "GNF", "XOF" ou "USD"
          returnUrl: '',
          // (Optionnel) URL de retour
          callbackUrl: '',
          // (Optionnel) URL de callback
        ),
      );
      setState(() {
        output = '''
              Status: ${paymentResponse.status}
              Pay ID: ${paymentResponse.payId}
              URL de paiement: ${paymentResponse.paymentUrl}
        ''';
      });

      // Vous pouvez remplacer log par print selon vos bésoins.
      log('Status: ${paymentResponse.status}');
      log('Pay ID: ${paymentResponse.payId}');
      log('URL de paiement: ${paymentResponse.paymentUrl}');
    } on LengopayException catch (e) {
      log('Erreur Lengopay: ${e.toString()}');
      setState(() {
        output = 'Erreur Lengopay: ${e.toString()}';
      });
    } catch (e) {
      setState(() {
        output = 'Erreur inattendue: ${e.toString()}';
      });
      log('Erreur inattendue: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lengo Pay Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lengo Pay Flutter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: testPayment,
                child: Text('Tester le payement'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                output,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
