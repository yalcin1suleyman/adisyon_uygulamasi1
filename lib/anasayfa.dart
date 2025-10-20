import 'package:flutter/material.dart';
import 'package:tasarim_calismasi_adisyon1/masa_duzenleme_sayfasi.dart';
import 'package:tasarim_calismasi_adisyon1/renkler.dart';
import 'package:tasarim_calismasi_adisyon1/masa_bilgi.dart';
import 'package:tasarim_calismasi_adisyon1/main.dart'; // ResponsiveHelper için eklendi
import 'package:tasarim_calismasi_adisyon1/l10n/app_localizations.dart'; // Çoklu dil desteği için eklendi

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  final List<MasaBilgi> _masaListesi = [];

  @override
  void initState() {
    super.initState();
    _masaListesi.addAll([
      MasaBilgi("Masa 1", "Dolu", "14:30", 180),
      MasaBilgi("Masa 2", "Boş", "--:--", 0),
      MasaBilgi("Masa 3", "Hazırlanıyor", "--:--", 60),
      MasaBilgi("Masa 4", "Dolu", "13:45", 150),
      MasaBilgi("Masa 5", "Boş", "--:--", 0),
      MasaBilgi("Masa 6", "Dolu", "15:15", 95),
      MasaBilgi("Masa 7", "Boş", "--:--", 0),
      MasaBilgi("Masa 8", "Dolu", "14:10", 75),
      MasaBilgi("Masa 9", "Hazırlanıyor", "--:--", 45),
      MasaBilgi("Masa 10", "Dolu", "16:00", 210),
      MasaBilgi("Masa 11", "Boş", "--:--", 0),
      MasaBilgi("Masa 12", "Hazırlanıyor", "--:--", 90),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // Çeviriler için AppLocalizations nesnesini alalım
    final l10n = AppLocalizations.of(context)!;
    
    // Ekran boyutuna göre grid sütun sayısını ayarla
    final crossAxisCount = ResponsiveHelper.getGridCrossAxisCount(context, defaultCount: 3);
    
    // Ekran boyutuna göre padding değerlerini ayarla
    final screenPadding = ResponsiveHelper.getScreenPadding(context);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: renk5Ana,
        centerTitle: true,
        title: Text(
          l10n.anasayfa,
          style: TextStyle(
            color: renk6Yazi, 
            fontFamily: "yaziTipi2",
            fontSize: ResponsiveHelper.getFontSize(context, 18),
          ),
        ),
      ),
      body: Padding(
        padding: screenPadding,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              l10n.kafeAdi,
              style: TextStyle(
                fontSize: ResponsiveHelper.getFontSize(context, 24),
                fontWeight: FontWeight.bold,
                fontFamily: "yaziTipi1",
                color: renk5Ana,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _iconText("resimler/para.png", "1.240₺"),
                _iconText("resimler/masa.png", "5/12"),
                _iconText("resimler/saat.png", "3 sipariş"),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                padding: const EdgeInsets.all(10),
                childAspectRatio: ResponsiveHelper.isDesktop(context) ? 1.2 : 0.95,
                children: _masaListesi.asMap().entries.map((entry) {
                  int index = entry.key;
                  MasaBilgi masa = entry.value;
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MasaDuzenleSayfasi(
                            masa: masa,
                            onGuncelle: (guncelMasa) {
                              setState(() {
                                _masaListesi[index] = guncelMasa;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: MasaKarti(masa: masa),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconText(String iconPath, String text) {
    return Column(
      children: [
        Image.asset(iconPath, width: 30, height: 30),
        const SizedBox(height: 4),
        Text(
          text, 
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 14), 
            fontWeight: FontWeight.w500
          )
        ),
      ],
    );
  }
}