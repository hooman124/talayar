import 'package:flutter/material.dart';
import '../utils/gold_formulas.dart';
import '../widgets/number_input.dart';
import '../widgets/result_card.dart';

class SellCalculatorScreen extends StatefulWidget {
  const SellCalculatorScreen({super.key});

  @override
  State<SellCalculatorScreen> createState() => _SellCalculatorScreenState();
}

class _SellCalculatorScreenState extends State<SellCalculatorScreen> {
  final priceController = TextEditingController();
  final weightController = TextEditingController();
  final karatController = TextEditingController(text: '18');

  double? result;
  double? pureWeight;

  @override
  void dispose() {
    priceController.dispose();
    weightController.dispose();
    karatController.dispose();
    super.dispose();
  }

  double parse(String value) {
    return double.tryParse(value.replaceAll(',', '')) ?? 0;
  }

  void calculate() {
    final price18 = parse(priceController.text);
    final weight = parse(weightController.text);
    final karat = parse(karatController.text);

    if (price18 <= 0 || weight <= 0 || karat <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لطفاً اطلاعات را کامل و صحیح وارد کنید.'),
        ),
      );
      return;
    }

    final value = weight * (price18 * karat / 18);
    final convertedWeight = GoldFormulas.convertKarat(
      weight: weight,
      fromKarat: karat,
      toKarat: 24,
    );

    setState(() {
      result = value;
      pureWeight = convertedWeight;
    });
  }

  void clear() {
    priceController.clear();
    weightController.clear();
    karatController.text = '18';

    setState(() {
      result = null;
      pureWeight = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'محاسبه قیمت فروش',
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
                      'ارزش تقریبی طلای خود را بر اساس قیمت روز محاسبه کنید.',
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
            ),
            const SizedBox(height: 14),

            NumberInput(
              controller: weightController,
              label: 'وزن طلا',
              suffix: 'گرم',
            ),
            const SizedBox(height: 14),

            NumberInput(
              controller: karatController,
              label: 'عیار طلا',
              suffix: 'عیار',
              hint: 'مثلاً 18',
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

            if (result != null)
              ResultCard(
                title: 'نتیجه محاسبه',
                rows: [
                  ResultRow(
                    label: 'ارزش تقریبی طلا',
                    value: result!,
                  ),
                  ResultRow(
                    label: 'معادل وزن در عیار ۲۴',
                    value: pureWeight!,
                    unit: 'گرم',
                  ),
                ],
              ),

            if (result != null)
              Container(
                margin: const EdgeInsets.only(top: 14),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text(
                  'این مبلغ تقریبی است و ممکن است قیمت خرید طلافروش، کسرها و شرایط معامله باعث تفاوت مبلغ نهایی شود.',
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
