import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tasarim_calismasi_adisyon1/anasayfa.dart';
import 'package:tasarim_calismasi_adisyon1/siparis_sayfasi.dart';
import 'package:tasarim_calismasi_adisyon1/odeme_sayfasi.dart';
import 'package:tasarim_calismasi_adisyon1/rapor_sayfasi.dart';
import 'package:tasarim_calismasi_adisyon1/renkler.dart';
import 'package:tasarim_calismasi_adisyon1/dil_yonetimi.dart';
import 'package:tasarim_calismasi_adisyon1/l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DilYonetimi(),
      child: const AdisyonApp(),
    ),
  );
}

class AdisyonApp extends StatelessWidget {
  const AdisyonApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dilYonetimi = Provider.of<DilYonetimi>(context);
    
    return MaterialApp(
      title: 'Adisyon Uygulaması',
      debugShowCheckedModeBanner: false,
      
      // Çoklu dil desteği için eklenen kısımlar
      locale: dilYonetimi.guncelDil,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: DilYonetimi.desteklenenDiller,
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: renk5Ana),
        fontFamily: "yaziTipi1",
        useMaterial3: true,
      ),
      home: const AnaEkran(),
    );
  }
}

// Ekran boyutlarına göre responsive tasarım için yardımcı sınıf
class ResponsiveHelper {
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 900;
  
  static double getFontSize(BuildContext context, double baseFontSize) {
    if (isMobile(context)) return baseFontSize;
    if (isTablet(context)) return baseFontSize * 1.2;
    return baseFontSize * 1.4; // desktop
  }
  
  static EdgeInsets getScreenPadding(BuildContext context) {
    if (isMobile(context)) return const EdgeInsets.all(8.0);
    if (isTablet(context)) return const EdgeInsets.all(16.0);
    return const EdgeInsets.all(24.0); // desktop
  }
  
  static int getGridCrossAxisCount(BuildContext context, {int defaultCount = 3}) {
    if (isMobile(context)) return defaultCount;
    if (isTablet(context)) return defaultCount + 1;
    return defaultCount + 2; // desktop
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  int _secilenIndex = 0;

  final List<Widget> _sayfalar = [
    const Anasayfa(),
    const SiparisSayfasi(),
    const OdemeSayfasi(),
    const RaporSayfasi(),
  ];

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final isLargeScreen = ResponsiveHelper.isTablet(context) || ResponsiveHelper.isDesktop(context);
    
    // Dil değiştirme butonu
    final dilDegistirmeButonu = PopupMenuButton<String>(
      icon: const Icon(Icons.language, color: Colors.white),
      onSelected: (String dilKodu) {
        Provider.of<DilYonetimi>(context, listen: false)
            .dilDegistir(Locale(dilKodu));
      },
      itemBuilder: (context) {
        return DilYonetimi.desteklenenDiller.map((locale) {
          return PopupMenuItem<String>(
            value: locale.languageCode,
            child: Text(DilYonetimi.dilAdi(context, locale.languageCode)),
          );
        }).toList();
      },
    );
    
    // Tablet ve daha büyük ekranlar için yan yana görünüm
    if (isLargeScreen && isLandscape) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: renk5Ana,
          title: Text(
            AppLocalizations.of(context)!.appTitle,
            style: TextStyle(color: renk6Yazi),
          ),
          actions: [dilDegistirmeButonu],
        ),
        body: Row(
          children: [
            // Sol tarafta navigasyon menüsü
            NavigationRail(
              backgroundColor: renk5Ana,
              selectedIconTheme: IconThemeData(color: renk6Yazi),
              unselectedIconTheme: IconThemeData(color: renk6Yazi.withOpacity(0.6)),
              selectedLabelTextStyle: TextStyle(color: renk6Yazi),
              unselectedLabelTextStyle: TextStyle(color: renk6Yazi.withOpacity(0.6)),
              onDestinationSelected: (index) {
                setState(() {
                  _secilenIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              destinations: [
                NavigationRailDestination(
                  icon: const Icon(Icons.table_restaurant),
                  label: Text(AppLocalizations.of(context)!.masalar),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.list_alt),
                  label: Text(AppLocalizations.of(context)!.siparis),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.payment),
                  label: Text(AppLocalizations.of(context)!.odeme),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.insert_chart),
                  label: Text(AppLocalizations.of(context)!.rapor),
                ),
              ],
              selectedIndex: _secilenIndex,
            ),
            // Sağ tarafta içerik
            Expanded(
              child: _sayfalar[_secilenIndex],
            ),
          ],
        ),
      );
    }
    
    // Mobil görünüm veya dikey mod
    return Scaffold(
      appBar: AppBar(
        backgroundColor: renk5Ana,
        title: Text(
          AppLocalizations.of(context)!.appTitle,
          style: TextStyle(color: renk6Yazi),
        ),
        actions: [dilDegistirmeButonu],
      ),
      body: _sayfalar[_secilenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: renk5Ana,
        selectedItemColor: renk6Yazi,
        unselectedItemColor: renk6Yazi.withOpacity(0.6),
        currentIndex: _secilenIndex,
        onTap: (index) {
          setState(() {
            _secilenIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.table_restaurant), 
              label: AppLocalizations.of(context)!.masalar),
          BottomNavigationBarItem(
              icon: const Icon(Icons.list_alt), 
              label: AppLocalizations.of(context)!.siparis),
          BottomNavigationBarItem(
              icon: const Icon(Icons.payment), 
              label: AppLocalizations.of(context)!.odeme),
          BottomNavigationBarItem(
              icon: const Icon(Icons.insert_chart), 
              label: AppLocalizations.of(context)!.rapor),
        ],
      ),
    );
  }
}