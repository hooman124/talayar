import 'package:flutter/material.dart';


class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'فاکتور طلا',
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
                    Icons.receipt_long_outlined,
                    color: Color(0xFF9A7525),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'جزئیات یک فاکتور نمونه خرید طلا را مشاهده کنید.',
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

            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'فاکتور خرید طلا',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'طلایار',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const Divider(height: 30),

                    _InvoiceRow(
                      title: 'نوع طلا',
                      value: 'طلای ۱۸ عیار',
                    ),
                    _InvoiceRow(
                      title: 'وزن',
                      value: '2.50 گرم',
                    ),
                    _InvoiceRow(
                      title: 'قیمت هر گرم',
                      value: '5,000,000 تومان',
                    ),
                    _InvoiceRow(
                      title: 'قیمت طلای خام',
                      value: '12,500,000 تومان',
                    ),
                    _InvoiceRow(
                      title: 'اجرت ساخت',
                      value: '2,500,000 تومان',
                    ),
                    _InvoiceRow(
                      title: 'سود فروشنده',
                      value: '1,050,000 تومان',
                    ),
                    _InvoiceRow(
                      title: 'مالیات ۱۰٪',
                      value: '355,000 تومان',
                    ),

                    const Divider(height: 30),

                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4E8C9),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: const Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Expanded(
                            child: Text(
                              'مبلغ نهایی',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            '16,405,000 تومان',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9A7525),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 14),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .surfaceContainerHighest,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Text(
                'این صفحه نمونه‌ای از ساختار فاکتور است. اطلاعات واقعی می‌تواند از محاسبه قیمت طلا دریافت شود.',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InvoiceRow extends StatelessWidget {
  final String title;
  final String value;

  const _InvoiceRow({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            value,
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
