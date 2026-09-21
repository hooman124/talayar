class GoldFormulas {
  static double rawGoldValue({required double weight, required double pricePerGram}) => weight * pricePerGram;
  static double makingCharge({required double rawValue, required double makingPercent}) => rawValue * makingPercent / 100;
  static double sellerProfit({required double rawValue, required double makingValue, required double profitPercent}) => (rawValue + makingValue) * profitPercent / 100;
  static double tax({required double taxBase, required double taxPercent}) => taxBase * taxPercent / 100;
  static double finalPrice({required double rawValue, required double makingValue, required double profitValue, required double taxValue}) => rawValue + makingValue + profitValue + taxValue;
  static double convertKarat({required double weight, required double fromKarat, required double toKarat}) => toKarat <= 0 ? 0 : weight * fromKarat / toKarat;
}
