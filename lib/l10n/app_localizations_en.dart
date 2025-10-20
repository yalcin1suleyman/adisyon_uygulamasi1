// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'POS Application';

  @override
  String get anasayfa => 'Home';

  @override
  String get masalar => 'Tables';

  @override
  String get siparis => 'Order';

  @override
  String get odeme => 'Payment';

  @override
  String get rapor => 'Report';

  @override
  String get kafeAdi => 'CAFE NAME';

  @override
  String get masaSecimi => 'Select Table';

  @override
  String get sepetBos => 'Cart Empty';

  @override
  String get siparisiGonder => 'Send Order';

  @override
  String siparisGonderildi(Object masa) {
    return 'Order sent for $masa';
  }

  @override
  String toplamTutar(Object tutar) {
    return 'Total: $tutar₺';
  }

  @override
  String masaSiparisi(Object masa) {
    return '$masa Order';
  }

  @override
  String get icecekler => 'Drinks';

  @override
  String get tatlilar => 'Desserts';

  @override
  String get anaYemekler => 'Main Dishes';

  @override
  String get masaDuzenle => 'Edit Table';

  @override
  String get masaAdi => 'Table Name';

  @override
  String get durum => 'Status';

  @override
  String get saat => 'Time';

  @override
  String get tutar => 'Amount (₺)';

  @override
  String get kaydet => 'Save';

  @override
  String get bos => 'Empty';

  @override
  String get dolu => 'Occupied';

  @override
  String get hazirlaniyor => 'Preparing';

  @override
  String get odemeTipi => 'Payment Type';

  @override
  String get nakit => 'Cash';

  @override
  String get krediKarti => 'Credit Card';

  @override
  String get indirimUygula => 'Apply Discount';

  @override
  String get indirimOrani => 'Discount Rate (%)';

  @override
  String get odenecekTutar => 'Amount to Pay';

  @override
  String get odemeyiTamamla => 'Complete Payment';

  @override
  String get odemeOnayi => 'Payment Confirmation';

  @override
  String odemeAlindi(Object masa, Object tutar, Object odemeTipi) {
    return '$odemeTipi payment of $tutar₺ received for $masa.';
  }

  @override
  String get tamam => 'OK';

  @override
  String get raporlar => 'Reports';

  @override
  String get satisRaporu => 'Sales Report';

  @override
  String get urunRaporu => 'Product Report';

  @override
  String get masaRaporu => 'Table Report';

  @override
  String get tarihAraligi => 'Date Range';

  @override
  String get bugun => 'Today';

  @override
  String get buHafta => 'This Week';

  @override
  String get buAy => 'This Month';

  @override
  String get tumu => 'All';

  @override
  String get toplamSatis => 'Total Sales';

  @override
  String get siparisSayisi => 'Number of Orders';

  @override
  String get ortalamaSiparis => 'Average Order';

  @override
  String get sonSatislar => 'Recent Sales';

  @override
  String get toplamUrun => 'Total Products';

  @override
  String get enCokSatan => 'Best Seller';

  @override
  String get urunSatisRaporu => 'Product Sales Report';

  @override
  String get urun => 'Product';

  @override
  String get adet => 'Quantity';

  @override
  String get toplam => 'Total';

  @override
  String get toplamMasa => 'Total Tables';

  @override
  String get ortalamaSure => 'Average Duration';

  @override
  String get masaKullanimRaporu => 'Table Usage Report';

  @override
  String get masa => 'Table';

  @override
  String get kullanim => 'Usage';

  @override
  String get ortSure => 'Avg. Time';

  @override
  String get ciro => 'Revenue';

  @override
  String get dil => 'Language';

  @override
  String get dilSecin => 'Select Language';

  @override
  String get turkce => 'Turkish';

  @override
  String get ingilizce => 'English';
}
