import 'package:flutter/material.dart';
import '../widgets/calculator_card.dart';
import 'gold_calculator_screen.dart';
import 'sell_calculator_screen.dart';
import 'invoice_screen.dart';
import 'karat_converter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  void _open(BuildContext context, Widget page) => Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('طلایار', style: TextStyle(fontWeight: FontWeight.w800))),
    body: SafeArea(child: ListView(padding: const EdgeInsets.fromLTRB(20, 8, 20, 24), children: [
      Container(padding: const EdgeInsets.all(22), margin: const EdgeInsets.only(bottom: 22), decoration: BoxDecoration(gradient: const LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [Color(0xFFF1E2B9), Color(0xFFFFF9EA)]), borderRadius: BorderRadius.circular(24)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('محاسبه‌گر هوشمند طلا', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900)),
        SizedBox(height: 8), Text('محاسبه سریع قیمت، فروش، فاکتور و تبدیل عیار', style: TextStyle(fontSize: 13.5)),
        SizedBox(height: 14), Row(children: [Icon(Icons.info_outline_rounded, size: 17), SizedBox(width: 7), Expanded(child: Text('قیمت طلا در این نسخه به‌صورت دستی وارد می‌شود.', style: TextStyle(fontSize: 11.5)))])
      ])),
      CalculatorCard(icon: Icons.calculate_rounded, title: 'محاسبه قیمت طلا', subtitle: 'قیمت نهایی خرید با اجرت، سود و مالیات', onTap: () => _open(context, const GoldCalculatorScreen())),
      CalculatorCard(icon: Icons.sell_rounded, title: 'محاسبه قیمت فروش', subtitle: 'محاسبه تقریبی ارزش طلای موجود', onTap: () => _open(context, const SellCalculatorScreen())),
      CalculatorCard(icon: Icons.swap_vert_rounded, title: 'تبدیل عیار', subtitle: 'تبدیل وزن طلا بین عیارهای مختلف', onTap: () => _open(context, const KaratConverterScreen())),
      CalculatorCard(icon: Icons.receipt_long_rounded, title: 'فاکتور طلا', subtitle: 'نمایش جزئیات کامل محاسبه', onTap: () => _open(context, const InvoiceScreen())),
      const SizedBox(height: 8),
      Center(child: Text('طلایار • نسخه ۱.۰.۰', style: TextStyle(fontSize: 11, color: Colors.grey))),
    ])),
  );
}
