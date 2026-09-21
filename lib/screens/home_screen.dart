import 'package:flutter/material.dart';
import 'gold_calculator_screen.dart';
import 'sell_calculator_screen.dart';
import 'karat_converter_screen.dart';
import 'invoice_screen.dart';
import '../widgets/calculator_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void openPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFFC59A3D),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              Icons.auto_awesome,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'طلایار',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'محاسبه‌گر هوشمند طلا',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.settings_outlined),
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),
                      Container(
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFC59A3D),
                              Color(0xFF9A7525),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                const Expanded(
                                  child: Text(
                                    'محاسبه سریع و دقیق',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.18),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.calculate_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'قیمت طلا، اجرت، سود و مالیات را در چند ثانیه محاسبه کنید.',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                height: 1.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 26),
                      const Text(
                        'ابزارهای طلایار',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    CalculatorCard(
                      icon: Icons.calculate_outlined,
                      title: 'محاسبه قیمت طلا',
                      subtitle: 'محاسبه قیمت نهایی با اجرت، سود و مالیات',
                      onTap: () => openPage(
                        context,
                        const GoldCalculatorScreen(),
                      ),
                    ),
                    CalculatorCard(
                      icon: Icons.sell_outlined,
                      title: 'محاسبه قیمت فروش',
                      subtitle: 'محاسبه تقریبی ارزش طلای شما',
                      onTap: () => openPage(
                        context,
                        const SellCalculatorScreen(),
                      ),
                    ),
                    CalculatorCard(
                      icon: Icons.swap_vert_rounded,
                      title: 'تبدیل عیار',
                      subtitle: 'تبدیل وزن طلا بین عیارهای مختلف',
                      onTap: () => openPage(
                        context,
                        const KaratConverterScreen(),
                      ),
                    ),
                    CalculatorCard(
                      icon: Icons.receipt_long_outlined,
                      title: 'فاکتور طلا',
                      subtitle: 'نمایش جزئیات کامل مبلغ خرید',
                      onTap: () => openPage(
                        context,
                        const InvoiceScreen(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Text(
                        'طلایار • نسخه ۱.۱.۰',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
