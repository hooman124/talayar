import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeChanged;

  const SettingsScreen({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'تنظیمات',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const _SectionTitle(
              title: 'ظاهر برنامه',
            ),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: RadioGroup<ThemeMode>(
                groupValue: themeMode,
                onChanged: (value) {
                  if (value != null) {
                    onThemeChanged(value);
                  }
                },
                child: const Column(
                  children: [
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.light,
                      title: Text(
                        'حالت روشن',
                        textAlign: TextAlign.right,
                      ),
                      subtitle: Text(
                        'استفاده از تم روشن',
                        textAlign: TextAlign.right,
                      ),
                      secondary: Icon(
                        Icons.light_mode_outlined,
                      ),
                    ),
                    Divider(height: 1),
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.dark,
                      title: Text(
                        'حالت تاریک',
                        textAlign: TextAlign.right,
                      ),
                      subtitle: Text(
                        'استفاده از تم تاریک',
                        textAlign: TextAlign.right,
                      ),
                      secondary: Icon(
                        Icons.dark_mode_outlined,
                      ),
                    ),
                    Divider(height: 1),
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.system,
                      title: Text(
                        'مطابق تنظیمات گوشی',
                        textAlign: TextAlign.right,
                      ),
                      subtitle: Text(
                        'انتخاب خودکار حالت روشن یا تاریک',
                        textAlign: TextAlign.right,
                      ),
                      secondary: Icon(
                        Icons.settings_suggest_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),

            const _SectionTitle(
              title: 'درباره طلایار',
            ),

            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const ListTile(
                leading: SizedBox(
                  width: 44,
                  height: 44,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFFC59A3D),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                    ),
                    child: Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: Text(
                  'طلایار',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'محاسبه‌گر قیمت طلا',
                  textAlign: TextAlign.right,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const ListTile(
                leading: Icon(
                  Icons.info_outline,
                ),
                title: Text(
                  'نسخه برنامه',
                  textAlign: TextAlign.right,
                ),
                trailing: Text(
                  '1.1.0',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              themeMode == ThemeMode.dark
                  ? 'حالت تاریک فعال است'
                  : themeMode == ThemeMode.light
                      ? 'حالت روشن فعال است'
                      : 'حالت خودکار فعال است',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 4,
        bottom: 10,
      ),
      child: Text(
        title,
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
