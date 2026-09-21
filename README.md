# طلایار | Talayar

اپلیکیشن Flutter برای محاسبه قیمت طلا، ارزش فروش، تبدیل عیار و فاکتور.

## نسخه 1.0.0
- محاسبه قیمت خرید
- محاسبه تقریبی ارزش فروش
- تبدیل عیار
- فاکتور ساده
- بدون API و سرور
- آماده Build با GitHub Actions

## GitHub Actions
فایل `.github/workflows/build.yml` از کانال stable Flutter استفاده می‌کند، Android platform files را تولید می‌کند، `flutter analyze` اجرا می‌کند و APK release می‌سازد.

خروجی: `build/app/outputs/flutter-apk/app-release.apk`

> نرخ قیمت طلا و درصدهای اجرت، سود و مالیات در نسخه اول دستی هستند.
