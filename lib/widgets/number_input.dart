import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String suffix;
  final bool decimal;
  const NumberInput({super.key, required this.controller, required this.label, this.suffix = '', this.decimal = true});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: decimal),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
      decoration: InputDecoration(labelText: label, suffixText: suffix.isEmpty ? null : suffix),
    );
  }
}
