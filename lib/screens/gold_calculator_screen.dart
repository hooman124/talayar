import 'package:flutter/material.dart';
import '../utils/gold_formulas.dart';
import '../widgets/number_input.dart';
import '../widgets/result_card.dart';

class GoldCalculatorScreen extends StatefulWidget {
  const GoldCalculatorScreen({super.key});

  @override
  State<GoldCalculatorScreen> createState() => _GoldCalculatorScreenState();
}

class _GoldCalculatorScreenState extends State<GoldCalculatorScreen> {
  final priceController = TextEditingController();
  final weightController = TextEditingController();
  final makingController = TextEditingController(text: '0');
  final profitController = TextEditingController(text: '0');

  double? rawValue;
  double? makingValue;
  double? profitValue;
  double? taxValue;
  double? totalValue;

  @override
  void dispose() {
    priceController.dispose();
    weightController.dispose();
    makingController.dispose();
    profitController.dispose();
    super.dispose();
  }

  double parse(String value) {
    return double.tryParse(value.replaceAll(',', '')) ?? 0;
  }

  void calculate() {
    final price = parse(priceController.text);
    final weight = parse(weightController.text);
    final makingPercent = parse(makingController.text);
    final profitPercent = parse(profitController.text);

    if (price <= 0 || weight <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لطفاً قیمت هر گرم و وزن طلا را وارد کنید.'),
        ),
      );
      return;
    }

    final raw = GoldFormulas.rawGoldValue(
      weight: weight,
      pricePerGram: price,
    );

    final making = GoldFormulas.makingCharge(
      rawValue: raw,
      makingPercent: makingPercent,
    );

    final profit = GoldFormulas.sellerProfit(
      rawValue: raw,
      makingValue: making,
      profitPercent: profitPercent,
    );

    final tax = GoldFormulas.tax(
      makingValue: making,
      profitValue: profit,
    );

    final total = GoldFormulas.finalPrice(
      rawValue: raw,
      makingValue: making,
      profitValue: profit,
      taxValue: tax,
    );

    setState(() {
      rawValue = raw;
      makingValue = making;
      profitValue = profit;
      taxValue = tax;
      totalValue = total;
    });
  }

  void clear() {
    priceController.clear();
    weightController.clear();
    makingController.text = '0';
    profitController.text = '0';

    setState(() {
      rawValue = null;
      makingValue = null;
      profitValue = null;
      taxValue = null;
      totalValue = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'محاسبه قیمت طلا',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFF4E8C9),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Row(
                textDirection: TextDirection.rtl,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Color(0xFF9A7525),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'قیمت هر گرم طلای ۱۸ عیار را وارد کنید.',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        height: 1.6,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            NumberInput(
              controller: priceController,
              label: 'قیمت هر گرم طلای ۱۸ عیار',
              suffix: 'تومان',
              hint: 'مثلاً ۵,۰۰۰,۰۰۰',
            ),
            const SizedBox(height: 14),

            NumberInput(
              controller: weightController,
              label: 'وزن طلا',
              suffix: 'گرم',
              hint: 'مثلاً 2.5',
            ),
            const SizedBox(height: 14),

            NumberInput(
              controller: makingController,
              label: 'اجرت ساخت',
              suffix: '%',
              hint: 'مثلاً 20',
            ),
            const SizedBox(height: 14),

            NumberInput(
              controller: profitController,
              label: 'سود فروشنده',
              suffix: '%',
              hint: 'مثلاً 7',
            ),

            const SizedBox(height: 22),

            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: calculate,
                    icon: const Icon(Icons.calculate_outlined),
                    label: const Text('محاسبه'),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFC59A3D),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  onPressed: clear,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: const Icon(Icons.refresh_rounded),
                ),
              ],
            ),

            if (totalValue != null)
              ResultCard(
                title: 'جزئیات محاسبه',
                rows: [
                  ResultRow(
                    label: 'قیمت طلای خام',
                    value: rawValue!,
                  ),
                  ResultRow(
                    label: 'اجرت ساخت',
                    value: makingValue!,
                  ),
                  ResultRow(
                    label: 'سود فروشنده',
                    value: profitValue!,
                  ),
                  ResultRow(
                    label: 'مالیات ۱۰٪',
                    value: taxValue!,
                  ),
                  ResultRow(
                    label: 'قیمت نهایی',
                    value: totalValue!,
                  ),
                ],
              ),

            if (totalValue != null)
              Container(
                margin: const EdgeInsets.only(top: 14),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text(
                  'توجه: مالیات در این نسخه برابر با ۱۰٪ مجموع اجرت ساخت و سود فروشنده محاسبه می‌شود.',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.7,
                    color: Colors.grey,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
