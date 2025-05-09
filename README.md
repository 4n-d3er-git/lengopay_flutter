<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

lengopay_flutter
========
[![pub package](https://img.shields.io/pub/v/animated_hint_textfield.svg)](https://pub.dev/packages/lengopay_flutter)
[![pub points](https://img.shields.io/pub/points/animated_hint_textfield?color=2E8B57&label=pub%20points)](https://pub.dev/packages/lengopay_flutter/score)

lengopay_flutter est un package Flutter permettant d'intégrer facilement [Lengo Pay](https://lengopay.com) dans vos applications. Il simplifie la génération d'URL de paiement et la gestion des notifications de callback.

Fonctionnalités
---------------

*   **Génération d'URL de paiement** : Créez une URL pour chaque transaction avec un montant et une devise spécifiques.
    
*   **Gestion des callbacks** : Recevez les notifications sur le statut des paiements.
    
*   **Support multi-devises** : Accepte plusieurs devises comme GNF, XOF, USD, etc.

*   **Vérification du statut de paiement** : Vérifiez les statuts de vos transactions.
    

Installation
------------

Ajoutez lengopay_flutter comme dépendance dans votre projet Flutter en exécutant la commande suivante :

`   flutter pub add lengopay_flutter   `

Ou ajoutez-le manuellement dans le fichier pubspec.yaml :

```
dependencies:
  lengopay_flutter: ^1.2.0
```

Puis, installez les dépendances avec :

`   flutter pub get   `

Utilisation de base
-------------------

### Importation

Commencez par importer le package dans votre projet :

```dart
import 'package:lengopay_flutter/lengopay_flutter.dart';
```

### Exemple de création d'une URL de paiement

```dart
 // Initialisation du service Lengopay avec votre clé de licence
    final lengopay = LengopayFlutter(
      // Initialisation du service Lengopay avec votre clé de licence
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
    // Vous pouvez remplacer log par print selon vos bésoins.
      log('Status: ${paymentResponse.status}');
      log('Pay ID: ${paymentResponse.payId}');
      log('URL de paiement: ${paymentResponse.paymentUrl}');
    } on LengopayException catch (e) {
      log('Erreur Lengopay: ${e.toString()}');
    } catch (e) {
      log('Erreur inattendue: ${e.toString()}');
    }
```

### Gestion des erreurs

Vous pouvez intercepter les exceptions en utilisant un bloc try-catch pour traiter les éventuelles erreurs comme :

*   La demande était mal formée ou il manquait les paramètres requis (400 Bad Request)
    
*   La clé API fournie était invalide ou manquante (401 Unauthorized)

*   La ressource demandée n'a pas été trouvée (404 Not Found)

*   Une erreur inattendue s'est produite sur le serveur. (500 Internal Server Error)
    

Gestion des notifications de callback
-------------------------------------

Lorsque vous fournissez une callbackUrl dans la requête, le serveur de Lengopay enverra une notification HTTP POST à cette URL une fois le paiement traité.

### Exemple de notification reçue

```dart
{
"pay_id": "123456789",
"status": "SUCCESS",
"amount": 1500,
"message": "Transaction Successful",
"client": "123456789"
}
```

Assurez-vous que votre serveur peut répondre correctement à ces notifications pour éviter toute perte de données.

Configuration requise
---------------------

*   Flutter SDK : >=3.27.0
    
*   Dart SDK : >=3.7.0
    
*   Lengo Pay Sandbox ou clé de production
    

Contribution
------------

Les contributions sont les bienvenues ! Suivez ces étapes pour contribuer :

1.  git clone https://github.com/4n-d3er-git/lengopay_flutter.git
    
2.  git checkout -b ma-fonctionnalite
    
3.  Effectuez vos modifications et ajoutez des tests.
    
4.  Soumettez une Pull Request.
    

Roadmap
-------

*  Historique des transactions
    
*   Documentation en plusieurs langues
    

Licence
-------

Ce package est sous licence **MIT**. Consultez le fichier [LICENSE](https://github.com/4n-d3er-git/lengopay_flutter/blob/main/LICENSE) pour plus d'informations.

Liens utiles
------------

*   [Documentation officielle de Lengo Pay](https://lengopay.com)
    
*   [Flutter Documentation](https://flutter.dev/docs)
    
*   [Dart API](https://api.dart.dev/)
    

Si vous avez des questions ou des suggestions, n'hésitez pas à ouvrir une issue sur [GitHub](https://github.com/4n-d3er-git/lengopay_flutter/issues).

## Made with ❤️ by [Anderson GOUMOU](https://github.com/4n-d3er-git/)