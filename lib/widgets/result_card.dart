import 'package:flutter/material.dart';

String formatMoney(double value) {
  final rounded = value.round().toString();
  final chars = rounded.split('');
  final result = StringBuffer();

  for (int i = 0; i < chars.length; i++) {
    if (i > 0 && (chars.length - i) % 3 == 0) {
      result.write(',');
    }

    result.write(chars[i]);
  }

  return result.toString();
}

class ResultCard extends StatelessWidget {
  final String title;
  final List<ResultRow> rows;

  const ResultCard({
    super.key,
    required this.title,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(top: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ...rows.asMap().entries.map(
              (entry) {
                final index = entry.key;
                final row = entry.value;

                final isLast = index == rows.length - 1;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    padding: isLast
                        ? const EdgeInsets.all(14)
                        : EdgeInsets.zero,
                    decoration: isLast
                        ? BoxDecoration(
                            color: colorScheme.primary.withValues(
                              alpha: 0.10,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          )
                        : null,
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Expanded(
                          child: Text(
                            row.label,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: isLast
                                  ? colorScheme.onSurface
                                  : colorScheme.onSurfaceVariant,
                              fontSize: isLast ? 15 : 14,
                              fontWeight: isLast
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Text(
                          '${formatMoney(row.value)} ${row.unit}',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: isLast ? 17 : 15,
                            fontWeight: FontWeight.bold,
                            color: isLast
                                ? colorScheme.primary
                                : colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ResultRow {
  final String label;
  final double value;
  final String unit;

  const ResultRow({
    required this.label,
    required this.value,
    this.unit = 'تومان',
  });
}
