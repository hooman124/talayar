class GoldFormulas {
  static double rawGoldValue({
    required double weight,
    required double pricePerGram,
  }) {
    return weight * pricePerGram;
  }

  static double makingCharge({
    required double rawValue,
    required double makingPercent,
  }) {
    return rawValue * makingPercent / 100;
  }

  static double sellerProfit({
    required double rawValue,
    required double makingValue,
    required double profitPercent,
  }) {
    return (rawValue + makingValue) * profitPercent / 100;
  }

  // مالیات = 10٪ × (اجرت ساخت + سود فروشنده)
  static double tax({
    required double makingValue,
    required double profitValue,
  }) {
    return (makingValue + profitValue) * 0.10;
  }

  static double finalPrice({
    required double rawValue,
    required double makingValue,
    required double profitValue,
    required double taxValue,
  }) {
    return rawValue + makingValue + profitValue + taxValue;
  }

  static double convertKarat({
    required double weight,
    required double fromKarat,
    required double toKarat,
  }) {
    if (toKarat <= 0) return 0;

    return weight * fromKarat / toKarat;
  }
}
