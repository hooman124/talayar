import 'package:flutter/material.dart';

class CalculatorCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const CalculatorCard({super.key, required this.icon, required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(children: [
            Container(width: 54, height: 54, decoration: BoxDecoration(color: const Color(0xFFF4E8C9), borderRadius: BorderRadius.circular(16)), child: Icon(icon, color: const Color(0xFF9A7322), size: 27)),
            const SizedBox(width: 15),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 5),
              Text(subtitle, style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600)),
            ])),
            Icon(Icons.chevron_left_rounded, color: Colors.grey.shade500),
          ]),
        ),
      ),
    );
  }
}
