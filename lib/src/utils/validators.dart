class Validators {
  static bool isValidAmount(double amount) {
    return amount > 0;
  }

  static bool isValidCurrency(String currency) {
    final validCurrencies = ['GNF', 'XOF', 'USD'];
    return validCurrencies.contains(currency.toUpperCase());
  }
}
