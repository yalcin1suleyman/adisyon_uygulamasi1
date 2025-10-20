// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Adisyon Uygulaması';

  @override
  String get anasayfa => 'Anasayfa';

  @override
  String get masalar => 'Masalar';

  @override
  String get siparis => 'Sipariş';

  @override
  String get odeme => 'Ödeme';

  @override
  String get rapor => 'Rapor';

  @override
  String get kafeAdi => 'KAFEMİZİN ADI';

  @override
  String get masaSecimi => 'Masa Seçimi';

  @override
  String get sepetBos => 'Sepet Boş';

  @override
  String get siparisiGonder => 'Siparişi Gönder';

  @override
  String siparisGonderildi(Object masa) {
    return '$masa için sipariş gönderildi';
  }

  @override
  String toplamTutar(Object tutar) {
    return 'Toplam: $tutar₺';
  }

  @override
  String masaSiparisi(Object masa) {
    return '$masa Siparişi';
  }

  @override
  String get icecekler => 'İçecekler';

  @override
  String get tatlilar => 'Tatlılar';

  @override
  String get anaYemekler => 'Ana Yemekler';

  @override
  String get masaDuzenle => 'Masa Düzenle';

  @override
  String get masaAdi => 'Masa Adı';

  @override
  String get durum => 'Durum';

  @override
  String get saat => 'Saat';

  @override
  String get tutar => 'Tutar (₺)';

  @override
  String get kaydet => 'Kaydet';

  @override
  String get bos => 'Boş';

  @override
  String get dolu => 'Dolu';

  @override
  String get hazirlaniyor => 'Hazırlanıyor';

  @override
  String get odemeTipi => 'Ödeme Tipi';

  @override
  String get nakit => 'Nakit';

  @override
  String get krediKarti => 'Kredi Kartı';

  @override
  String get indirimUygula => 'İndirim Uygula';

  @override
  String get indirimOrani => 'İndirim Oranı (%)';

  @override
  String get odenecekTutar => 'Ödenecek Tutar';

  @override
  String get odemeyiTamamla => 'Ödemeyi Tamamla';

  @override
  String get odemeOnayi => 'Ödeme Onayı';

  @override
  String odemeAlindi(Object masa, Object tutar, Object odemeTipi) {
    return '$masa için $tutar₺ tutarında $odemeTipi ödemesi alındı.';
  }

  @override
  String get tamam => 'Tamam';

  @override
  String get raporlar => 'Raporlar';

  @override
  String get satisRaporu => 'Satış Raporu';

  @override
  String get urunRaporu => 'Ürün Raporu';

  @override
  String get masaRaporu => 'Masa Raporu';

  @override
  String get tarihAraligi => 'Tarih Aralığı';

  @override
  String get bugun => 'Bugün';

  @override
  String get buHafta => 'Bu Hafta';

  @override
  String get buAy => 'Bu Ay';

  @override
  String get tumu => 'Tümü';

  @override
  String get toplamSatis => 'Toplam Satış';

  @override
  String get siparisSayisi => 'Sipariş Sayısı';

  @override
  String get ortalamaSiparis => 'Ortalama Sipariş';

  @override
  String get sonSatislar => 'Son Satışlar';

  @override
  String get toplamUrun => 'Toplam Ürün';

  @override
  String get enCokSatan => 'En Çok Satan';

  @override
  String get urunSatisRaporu => 'Ürün Satış Raporu';

  @override
  String get urun => 'Ürün';

  @override
  String get adet => 'Adet';

  @override
  String get toplam => 'Toplam';

  @override
  String get toplamMasa => 'Toplam Masa';

  @override
  String get ortalamaSure => 'Ortalama Süre';

  @override
  String get masaKullanimRaporu => 'Masa Kullanım Raporu';

  @override
  String get masa => 'Masa';

  @override
  String get kullanim => 'Kullanım';

  @override
  String get ortSure => 'Ort. Süre';

  @override
  String get ciro => 'Ciro';

  @override
  String get dil => 'Dil';

  @override
  String get dilSecin => 'Dil Seçin';

  @override
  String get turkce => 'Türkçe';

  @override
  String get ingilizce => 'İngilizce';
}
