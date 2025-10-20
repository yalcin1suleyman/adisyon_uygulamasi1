import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In tr, this message translates to:
  /// **'Adisyon Uygulaması'**
  String get appTitle;

  /// No description provided for @anasayfa.
  ///
  /// In tr, this message translates to:
  /// **'Anasayfa'**
  String get anasayfa;

  /// No description provided for @masalar.
  ///
  /// In tr, this message translates to:
  /// **'Masalar'**
  String get masalar;

  /// No description provided for @siparis.
  ///
  /// In tr, this message translates to:
  /// **'Sipariş'**
  String get siparis;

  /// No description provided for @odeme.
  ///
  /// In tr, this message translates to:
  /// **'Ödeme'**
  String get odeme;

  /// No description provided for @rapor.
  ///
  /// In tr, this message translates to:
  /// **'Rapor'**
  String get rapor;

  /// No description provided for @kafeAdi.
  ///
  /// In tr, this message translates to:
  /// **'KAFEMİZİN ADI'**
  String get kafeAdi;

  /// No description provided for @masaSecimi.
  ///
  /// In tr, this message translates to:
  /// **'Masa Seçimi'**
  String get masaSecimi;

  /// No description provided for @sepetBos.
  ///
  /// In tr, this message translates to:
  /// **'Sepet Boş'**
  String get sepetBos;

  /// No description provided for @siparisiGonder.
  ///
  /// In tr, this message translates to:
  /// **'Siparişi Gönder'**
  String get siparisiGonder;

  /// No description provided for @siparisGonderildi.
  ///
  /// In tr, this message translates to:
  /// **'{masa} için sipariş gönderildi'**
  String siparisGonderildi(Object masa);

  /// No description provided for @toplamTutar.
  ///
  /// In tr, this message translates to:
  /// **'Toplam: {tutar}₺'**
  String toplamTutar(Object tutar);

  /// No description provided for @masaSiparisi.
  ///
  /// In tr, this message translates to:
  /// **'{masa} Siparişi'**
  String masaSiparisi(Object masa);

  /// No description provided for @icecekler.
  ///
  /// In tr, this message translates to:
  /// **'İçecekler'**
  String get icecekler;

  /// No description provided for @tatlilar.
  ///
  /// In tr, this message translates to:
  /// **'Tatlılar'**
  String get tatlilar;

  /// No description provided for @anaYemekler.
  ///
  /// In tr, this message translates to:
  /// **'Ana Yemekler'**
  String get anaYemekler;

  /// No description provided for @masaDuzenle.
  ///
  /// In tr, this message translates to:
  /// **'Masa Düzenle'**
  String get masaDuzenle;

  /// No description provided for @masaAdi.
  ///
  /// In tr, this message translates to:
  /// **'Masa Adı'**
  String get masaAdi;

  /// No description provided for @durum.
  ///
  /// In tr, this message translates to:
  /// **'Durum'**
  String get durum;

  /// No description provided for @saat.
  ///
  /// In tr, this message translates to:
  /// **'Saat'**
  String get saat;

  /// No description provided for @tutar.
  ///
  /// In tr, this message translates to:
  /// **'Tutar (₺)'**
  String get tutar;

  /// No description provided for @kaydet.
  ///
  /// In tr, this message translates to:
  /// **'Kaydet'**
  String get kaydet;

  /// No description provided for @bos.
  ///
  /// In tr, this message translates to:
  /// **'Boş'**
  String get bos;

  /// No description provided for @dolu.
  ///
  /// In tr, this message translates to:
  /// **'Dolu'**
  String get dolu;

  /// No description provided for @hazirlaniyor.
  ///
  /// In tr, this message translates to:
  /// **'Hazırlanıyor'**
  String get hazirlaniyor;

  /// No description provided for @odemeTipi.
  ///
  /// In tr, this message translates to:
  /// **'Ödeme Tipi'**
  String get odemeTipi;

  /// No description provided for @nakit.
  ///
  /// In tr, this message translates to:
  /// **'Nakit'**
  String get nakit;

  /// No description provided for @krediKarti.
  ///
  /// In tr, this message translates to:
  /// **'Kredi Kartı'**
  String get krediKarti;

  /// No description provided for @indirimUygula.
  ///
  /// In tr, this message translates to:
  /// **'İndirim Uygula'**
  String get indirimUygula;

  /// No description provided for @indirimOrani.
  ///
  /// In tr, this message translates to:
  /// **'İndirim Oranı (%)'**
  String get indirimOrani;

  /// No description provided for @odenecekTutar.
  ///
  /// In tr, this message translates to:
  /// **'Ödenecek Tutar'**
  String get odenecekTutar;

  /// No description provided for @odemeyiTamamla.
  ///
  /// In tr, this message translates to:
  /// **'Ödemeyi Tamamla'**
  String get odemeyiTamamla;

  /// No description provided for @odemeOnayi.
  ///
  /// In tr, this message translates to:
  /// **'Ödeme Onayı'**
  String get odemeOnayi;

  /// No description provided for @odemeAlindi.
  ///
  /// In tr, this message translates to:
  /// **'{masa} için {tutar}₺ tutarında {odemeTipi} ödemesi alındı.'**
  String odemeAlindi(Object masa, Object tutar, Object odemeTipi);

  /// No description provided for @tamam.
  ///
  /// In tr, this message translates to:
  /// **'Tamam'**
  String get tamam;

  /// No description provided for @raporlar.
  ///
  /// In tr, this message translates to:
  /// **'Raporlar'**
  String get raporlar;

  /// No description provided for @satisRaporu.
  ///
  /// In tr, this message translates to:
  /// **'Satış Raporu'**
  String get satisRaporu;

  /// No description provided for @urunRaporu.
  ///
  /// In tr, this message translates to:
  /// **'Ürün Raporu'**
  String get urunRaporu;

  /// No description provided for @masaRaporu.
  ///
  /// In tr, this message translates to:
  /// **'Masa Raporu'**
  String get masaRaporu;

  /// No description provided for @tarihAraligi.
  ///
  /// In tr, this message translates to:
  /// **'Tarih Aralığı'**
  String get tarihAraligi;

  /// No description provided for @bugun.
  ///
  /// In tr, this message translates to:
  /// **'Bugün'**
  String get bugun;

  /// No description provided for @buHafta.
  ///
  /// In tr, this message translates to:
  /// **'Bu Hafta'**
  String get buHafta;

  /// No description provided for @buAy.
  ///
  /// In tr, this message translates to:
  /// **'Bu Ay'**
  String get buAy;

  /// No description provided for @tumu.
  ///
  /// In tr, this message translates to:
  /// **'Tümü'**
  String get tumu;

  /// No description provided for @toplamSatis.
  ///
  /// In tr, this message translates to:
  /// **'Toplam Satış'**
  String get toplamSatis;

  /// No description provided for @siparisSayisi.
  ///
  /// In tr, this message translates to:
  /// **'Sipariş Sayısı'**
  String get siparisSayisi;

  /// No description provided for @ortalamaSiparis.
  ///
  /// In tr, this message translates to:
  /// **'Ortalama Sipariş'**
  String get ortalamaSiparis;

  /// No description provided for @sonSatislar.
  ///
  /// In tr, this message translates to:
  /// **'Son Satışlar'**
  String get sonSatislar;

  /// No description provided for @toplamUrun.
  ///
  /// In tr, this message translates to:
  /// **'Toplam Ürün'**
  String get toplamUrun;

  /// No description provided for @enCokSatan.
  ///
  /// In tr, this message translates to:
  /// **'En Çok Satan'**
  String get enCokSatan;

  /// No description provided for @urunSatisRaporu.
  ///
  /// In tr, this message translates to:
  /// **'Ürün Satış Raporu'**
  String get urunSatisRaporu;

  /// No description provided for @urun.
  ///
  /// In tr, this message translates to:
  /// **'Ürün'**
  String get urun;

  /// No description provided for @adet.
  ///
  /// In tr, this message translates to:
  /// **'Adet'**
  String get adet;

  /// No description provided for @toplam.
  ///
  /// In tr, this message translates to:
  /// **'Toplam'**
  String get toplam;

  /// No description provided for @toplamMasa.
  ///
  /// In tr, this message translates to:
  /// **'Toplam Masa'**
  String get toplamMasa;

  /// No description provided for @ortalamaSure.
  ///
  /// In tr, this message translates to:
  /// **'Ortalama Süre'**
  String get ortalamaSure;

  /// No description provided for @masaKullanimRaporu.
  ///
  /// In tr, this message translates to:
  /// **'Masa Kullanım Raporu'**
  String get masaKullanimRaporu;

  /// No description provided for @masa.
  ///
  /// In tr, this message translates to:
  /// **'Masa'**
  String get masa;

  /// No description provided for @kullanim.
  ///
  /// In tr, this message translates to:
  /// **'Kullanım'**
  String get kullanim;

  /// No description provided for @ortSure.
  ///
  /// In tr, this message translates to:
  /// **'Ort. Süre'**
  String get ortSure;

  /// No description provided for @ciro.
  ///
  /// In tr, this message translates to:
  /// **'Ciro'**
  String get ciro;

  /// No description provided for @dil.
  ///
  /// In tr, this message translates to:
  /// **'Dil'**
  String get dil;

  /// No description provided for @dilSecin.
  ///
  /// In tr, this message translates to:
  /// **'Dil Seçin'**
  String get dilSecin;

  /// No description provided for @turkce.
  ///
  /// In tr, this message translates to:
  /// **'Türkçe'**
  String get turkce;

  /// No description provided for @ingilizce.
  ///
  /// In tr, this message translates to:
  /// **'İngilizce'**
  String get ingilizce;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
