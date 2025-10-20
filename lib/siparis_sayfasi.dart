import 'package:flutter/material.dart';
import 'package:tasarim_calismasi_adisyon1/renkler.dart';
import 'package:tasarim_calismasi_adisyon1/main.dart'; // ResponsiveHelper için eklendi
import 'package:tasarim_calismasi_adisyon1/l10n/app_localizations.dart'; // Çoklu dil desteği için eklendi

class SiparisSayfasi extends StatefulWidget {
  const SiparisSayfasi({super.key});

  @override
  State<SiparisSayfasi> createState() => _SiparisSayfasiState();
}

class _SiparisSayfasiState extends State<SiparisSayfasi> {
  final List<Kategori> _kategoriler = [];

  final List<SiparisItem> _sepet = [];
  int _secilenKategoriIndex = 0;
  String _secilenMasa = "Masa 1";

  @override
  void initState() {
    super.initState();
    _kategorilerOlustur();
  }

  // Kategorileri ve ürünleri oluştur
  void _kategorilerOlustur() {
    _kategoriler.clear();
    
    _kategoriler.add(
      Kategori("İçecekler", [
        Urun("Çay", 15.0, ""),
        Urun("Kahve", 35.0, ""),
        Urun("Türk Kahvesi", 30.0, ""),
        Urun("Ayran", 20.0, ""),
        Urun("Soda", 15.0, ""),
      ])
    );
    
    _kategoriler.add(
      Kategori("Tatlılar", [
        Urun("Baklava", 75.0, ""),
        Urun("Sütlaç", 45.0, ""),
        Urun("Künefe", 85.0, ""),
        Urun("Dondurma", 40.0, ""),
      ])
    );
    
    _kategoriler.add(
      Kategori("Ana Yemekler", [
        Urun("Köfte", 120.0, ""),
        Urun("Tavuk Şiş", 110.0, ""),
        Urun("Pide", 90.0, ""),
        Urun("Lahmacun", 70.0, ""),
      ])
    );
  }

  @override
  Widget build(BuildContext context) {
    // Çeviriler için AppLocalizations nesnesini alalım
    final l10n = AppLocalizations.of(context)!;
    
    // Kategori isimlerini çevirelim
    _kategoriler[0].ad = l10n.icecekler;
    _kategoriler[1].ad = l10n.tatlilar;
    _kategoriler[2].ad = l10n.anaYemekler;
    
    // Ekran boyutuna göre grid sütun sayısını ayarla
    final crossAxisCount = ResponsiveHelper.getGridCrossAxisCount(context, defaultCount: 3);
    
    // Ekran boyutuna göre padding değerlerini ayarla
    final screenPadding = ResponsiveHelper.getScreenPadding(context);
    
    // Ekran genişliğine göre sepet/ürün oranını ayarla
    final bool isLargeScreen = ResponsiveHelper.isTablet(context) || ResponsiveHelper.isDesktop(context);
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    
    // Büyük ekranlarda yatay mod için farklı layout
    if (isLargeScreen && isLandscape) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: renk5Ana,
          centerTitle: true,
          title: Text(
            l10n.siparis,
            style: TextStyle(
              color: renk6Yazi, 
              fontFamily: "yaziTipi2",
              fontSize: ResponsiveHelper.getFontSize(context, 18),
            ),
          ),
        ),
        body: Padding(
          padding: screenPadding,
          child: Row(
            children: [
              // Sol tarafta ürünler
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    // Masa seçimi
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            "${l10n.masaSecimi}: ", 
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ResponsiveHelper.getFontSize(context, 14),
                            )
                          ),
                          DropdownButton<String>(
                            value: _secilenMasa,
                            items: List.generate(12, (index) => "Masa ${index + 1}")
                                .map((masa) => DropdownMenuItem(value: masa, child: Text(masa)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _secilenMasa = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    
                    // Kategori seçimi
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _kategoriler.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ChoiceChip(
                              label: Text(_kategoriler[index].ad),
                              selected: _secilenKategoriIndex == index,
                              selectedColor: renk5Ana,
                              onSelected: (selected) {
                                setState(() {
                                  _secilenKategoriIndex = index;
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    
                    // Ürünler listesi
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: _kategoriler[_secilenKategoriIndex].urunler.length,
                        itemBuilder: (context, index) {
                          final urun = _kategoriler[_secilenKategoriIndex].urunler[index];
                          return UrunKarti(
                            urun: urun,
                            onTap: () {
                              setState(() {
                                bool urunVarMi = false;
                                for (var item in _sepet) {
                                  if (item.urun.ad == urun.ad) {
                                    item.adet++;
                                    urunVarMi = true;
                                    break;
                                  }
                                }
                                if (!urunVarMi) {
                                  _sepet.add(SiparisItem(urun, 1));
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              
              // Sağ tarafta sepet
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              l10n.masaSiparisi(_secilenMasa), 
                              style: TextStyle(
                                fontWeight: FontWeight.bold, 
                                fontSize: ResponsiveHelper.getFontSize(context, 16)
                              )
                            ),
                            Text(
                              l10n.toplamTutar(_hesaplaToplam().toStringAsFixed(2)), 
                              style: TextStyle(
                                fontWeight: FontWeight.bold, 
                                fontSize: ResponsiveHelper.getFontSize(context, 16)
                              )
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: _sepet.isEmpty
                            ? Center(child: Text(l10n.sepetBos))
                            : ListView.builder(
                                itemCount: _sepet.length,
                                itemBuilder: (context, index) {
                                  final item = _sepet[index];
                                  return ListTile(
                                    title: Text(
                                      item.urun.ad,
                                      style: TextStyle(
                                        fontSize: ResponsiveHelper.getFontSize(context, 14)
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${item.urun.fiyat.toStringAsFixed(2)}₺ x ${item.adet}",
                                      style: TextStyle(
                                        fontSize: ResponsiveHelper.getFontSize(context, 12)
                                      ),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("${(item.urun.fiyat * item.adet).toStringAsFixed(2)}₺"),
                                        IconButton(
                                          icon: const Icon(Icons.delete, color: Colors.red),
                                          onPressed: () {
                                            setState(() {
                                              _sepet.removeAt(index);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: renk5Ana,
                            foregroundColor: renk6Yazi,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          onPressed: _sepet.isEmpty ? null : _siparisGonder,
                          child: Text(
                            l10n.siparisiGonder,
                            style: TextStyle(
                              fontSize: ResponsiveHelper.getFontSize(context, 14)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    
    // Mobil görünüm veya dikey mod
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: renk5Ana,
        centerTitle: true,
        title: Text(
          l10n.siparis,
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
            // Masa seçimi
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text(
                    "${l10n.masaSecimi}: ", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ResponsiveHelper.getFontSize(context, 14),
                    )
                  ),
                  DropdownButton<String>(
                    value: _secilenMasa,
                    items: List.generate(12, (index) => "Masa ${index + 1}")
                        .map((masa) => DropdownMenuItem(value: masa, child: Text(masa)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _secilenMasa = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            
            // Kategori seçimi
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _kategoriler.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ChoiceChip(
                      label: Text(_kategoriler[index].ad),
                      selected: _secilenKategoriIndex == index,
                      selectedColor: renk5Ana,
                      onSelected: (selected) {
                        setState(() {
                          _secilenKategoriIndex = index;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            
            // Ürünler listesi
            Expanded(
              flex: 3,
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _kategoriler[_secilenKategoriIndex].urunler.length,
                itemBuilder: (context, index) {
                  final urun = _kategoriler[_secilenKategoriIndex].urunler[index];
                  return UrunKarti(
                    urun: urun,
                    onTap: () {
                      setState(() {
                        bool urunVarMi = false;
                        for (var item in _sepet) {
                          if (item.urun.ad == urun.ad) {
                            item.adet++;
                            urunVarMi = true;
                            break;
                          }
                        }
                        if (!urunVarMi) {
                          _sepet.add(SiparisItem(urun, 1));
                        }
                      });
                    },
                  );
                },
              ),
            ),
            
            // Sepet
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n.masaSiparisi(_secilenMasa), 
                            style: TextStyle(
                              fontWeight: FontWeight.bold, 
                              fontSize: ResponsiveHelper.getFontSize(context, 16)
                            )
                          ),
                          Text(
                            l10n.toplamTutar(_hesaplaToplam().toStringAsFixed(2)), 
                            style: TextStyle(
                              fontWeight: FontWeight.bold, 
                              fontSize: ResponsiveHelper.getFontSize(context, 16)
                            )
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: _sepet.isEmpty
                          ? Center(child: Text(l10n.sepetBos))
                          : ListView.builder(
                              itemCount: _sepet.length,
                              itemBuilder: (context, index) {
                                final item = _sepet[index];
                                return ListTile(
                                  title: Text(item.urun.ad),
                                  subtitle: Text("${item.urun.fiyat.toStringAsFixed(2)}₺ x ${item.adet}"),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("${(item.urun.fiyat * item.adet).toStringAsFixed(2)}₺"),
                                      IconButton(
                                        icon: const Icon(Icons.delete, color: Colors.red),
                                        onPressed: () {
                                          setState(() {
                                            _sepet.removeAt(index);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: renk5Ana,
                          foregroundColor: renk6Yazi,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: _sepet.isEmpty ? null : _siparisGonder,
                        child: Text(l10n.siparisiGonder),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _hesaplaToplam() {
    double toplam = 0;
    for (var item in _sepet) {
      toplam += item.urun.fiyat * item.adet;
    }
    return toplam;
  }

  void _siparisGonder() {
    // Çeviriler için AppLocalizations nesnesini alalım
    final l10n = AppLocalizations.of(context)!;
    
    // Sipariş gönderme işlemi
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.siparisGonderildi(_secilenMasa))),
    );
    setState(() {
      _sepet.clear();
    });
  }
}

class Kategori {
  String ad;
  final List<Urun> urunler;

  Kategori(this.ad, this.urunler);
}

class Urun {
  final String ad;
  final double fiyat;
  final String resimYolu;

  Urun(this.ad, this.fiyat, this.resimYolu);
}

class SiparisItem {
  final Urun urun;
  int adet;

  SiparisItem(this.urun, this.adet);
}

class UrunKarti extends StatelessWidget {
  final Urun urun;
  final VoidCallback onTap;

  const UrunKarti({super.key, required this.urun, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.fastfood, size: 40),
            const SizedBox(height: 8),
            Text(
              urun.ad,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveHelper.getFontSize(context, 14),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              "${urun.fiyat.toStringAsFixed(2)}₺",
              style: TextStyle(
                color: Colors.green,
                fontSize: ResponsiveHelper.getFontSize(context, 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}