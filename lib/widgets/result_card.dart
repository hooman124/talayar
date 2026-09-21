import 'package:flutter/material.dart';

String formatMoney(double value) => value.round().toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (m) => '${m[1]},');

class ResultRow extends StatelessWidget {
  final String title;
  final double value;
  final bool bold;
  const ResultRow({super.key, required this.title, required this.value, this.bold = false});
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.symmetric(vertical: 7), child: Row(children: [Expanded(child: Text(title, style: TextStyle(fontWeight: bold ? FontWeight.w700 : FontWeight.w400))), Text('${formatMoney(value)} تومان', style: TextStyle(fontWeight: bold ? FontWeight.w800 : FontWeight.w600, color: bold ? const Color(0xFF9A7322) : null))]));
}

class ResultCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ResultCard({super.key, required this.title, required this.children});
  @override
  Widget build(BuildContext context) => Card(elevation: 0, color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)), const Divider(height: 24), ...children])));
}
