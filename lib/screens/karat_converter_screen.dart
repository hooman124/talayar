import 'package:flutter/material.dart';
import '../utils/gold_formulas.dart';
import '../widgets/number_input.dart';
import '../widgets/result_card.dart';

class KaratConverterScreen extends StatefulWidget {
  const KaratConverterScreen({super.key});

  @override
  State<KaratConverterScreen> createState() => _KaratConverterScreenState();
}

class _KaratConverterScreenState extends State<KaratConverterScreen> {
  final weightController = TextEditingController();
  final fromKaratController = TextEditingController(text: '18');
  final toKaratController = TextEditingController(text: '24');

  double? result;

  @override
  void dispose() {
    weightController.dispose();
    fromKaratController.dispose();
    toKaratController.dispose();
    super.dispose();
  }

  double parse(String value) {
    return double.tryParse(value.replaceAll(',', '')) ?? 0;
  }

  void calculate() {
    final weight = parse(weightController.text);
    final fromKarat = parse(fromKaratController.text);
    final toKarat = parse(toKaratController.text);

    if (weight <= 0 || fromKarat <= 0 || toKarat <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لطفاً اطلاعات را کامل و صحیح وارد کنید.'),
        ),
      );
      return;
    }

    final converted = GoldFormulas.convertKarat(
      weight: weight,
      fromKarat: fromKarat,
      toKarat: toKarat,
    );

    setState(() {
      result = converted;
    });
  }

  void clear() {
    weightController.clear();
    fromKaratController.text = '18';
    toKaratController.text = '24';

    setState(() {
      result = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'تبدیل عیار',
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
                    Icons.swap_vert_rounded,
                    color: Color(0xFF9A7525),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'وزن طلا را از یک عیار به عیار دیگر تبدیل کنید.',
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
              controller: weightController,
              label: 'وزن طلا',
              suffix: 'گرم',
              hint: 'مثلاً 10',
            ),
            const SizedBox(height: 14),

            NumberInput(
              controller: fromKaratController,
              label: 'عیار فعلی',
              suffix: 'عیار',
              hint: 'مثلاً 18',
            ),
            const SizedBox(height: 14),

            NumberInput(
              controller: toKaratController,
              label: 'عیار مقصد',
              suffix: 'عیار',
              hint: 'مثلاً 24',
            ),

            const SizedBox(height: 22),

            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: calculate,
                    icon: const Icon(Icons.swap_horiz_rounded),
                    label: const Text('تبدیل'),
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
                title: 'نتیجه تبدیل',
                rows: [
                  ResultRow(
                    label: 'وزن معادل',
                    value: result!,
                    unit: 'گرم',
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
