import 'package:flutter/material.dart';
import 'package:tasarim_calismasi_adisyon1/l10n/app_localizations.dart';

class DilYonetimi extends ChangeNotifier {
  static final DilYonetimi _instance = DilYonetimi._internal();
  
  factory DilYonetimi() {
    return _instance;
  }
  
  DilYonetimi._internal();
  
  Locale _guncelDil = const Locale('tr');
  
  Locale get guncelDil => _guncelDil;
  
  void dilDegistir(Locale yeniDil) {
    _guncelDil = yeniDil;
    notifyListeners();
  }
  
  static List<Locale> desteklenenDiller = [
    const Locale('tr'),
    const Locale('en'),
  ];
  
  static String dilAdi(BuildContext context, String dilKodu) {
    switch (dilKodu) {
      case 'tr':
        return AppLocalizations.of(context)!.turkce;
      case 'en':
        return AppLocalizations.of(context)!.ingilizce;
      default:
        return dilKodu;
    }
  }
} 