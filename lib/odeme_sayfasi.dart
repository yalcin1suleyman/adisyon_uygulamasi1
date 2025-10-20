import 'package:flutter/material.dart';
import 'package:tasarim_calismasi_adisyon1/renkler.dart';
import 'package:tasarim_calismasi_adisyon1/masa_bilgi.dart';

class OdemeSayfasi extends StatefulWidget {
  const OdemeSayfasi({super.key});

  @override
  State<OdemeSayfasi> createState() => _OdemeSayfasiState();
}

class _OdemeSayfasiState extends State<OdemeSayfasi> {
  final List<MasaBilgi> _doluMasalar = [
    MasaBilgi("Masa 1", "Dolu", "14:30", 180),
    MasaBilgi("Masa 4", "Dolu", "13:45", 150),
    MasaBilgi("Masa 6", "Dolu", "15:15", 95),
    MasaBilgi("Masa 8", "Dolu", "14:10", 75),
    MasaBilgi("Masa 10", "Dolu", "16:00", 210),
  ];

  String _secilenOdemeTipi = "Nakit";
  MasaBilgi? _secilenMasa;
  bool _indirimUygula = false;
  double _indirimOrani = 10;
  final TextEditingController _indirimController = TextEditingController(text: "10");

  @override
  void dispose() {
    _indirimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: renk5Ana,
        centerTitle: true,
        title: Text(
          "Ödeme",
          style: TextStyle(color: renk6Yazi, fontFamily: "yaziTipi2"),
        ),
      ),
      body: Column(
        children: [
          // Masa seçimi
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Ödeme Yapılacak Masa Seçin",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: renk5Ana,
              ),
            ),
          ),

          // Dolu masalar listesi
          Expanded(
            flex: 2,
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _doluMasalar.length,
              itemBuilder: (context, index) {
                final masa = _doluMasalar[index];
                final secili = _secilenMasa?.isim == masa.isim;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _secilenMasa = masa;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: secili ? renk5Ana.withOpacity(0.2) : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: secili ? renk5Ana : Colors.grey.shade300,
                        width: secili ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          masa.isim,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secili ? renk5Ana : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${masa.tutar}₺",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: secili ? renk5Ana : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          masa.saat,
                          style: TextStyle(
                            fontSize: 12,
                            color: secili ? renk5Ana : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Ödeme detayları
          if (_secilenMasa != null)
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_secilenMasa!.isim} Ödeme Detayları",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Ödeme tipi seçimi
                    const Text("Ödeme Tipi:", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text("Nakit"),
                            value: "Nakit",
                            groupValue: _secilenOdemeTipi,
                            onChanged: (value) {
                              setState(() {
                                _secilenOdemeTipi = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text("Kredi Kartı"),
                            value: "Kredi Kartı",
                            groupValue: _secilenOdemeTipi,
                            onChanged: (value) {
                              setState(() {
                                _secilenOdemeTipi = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    // İndirim seçeneği
                    Row(
                      children: [
                        Checkbox(
                          value: _indirimUygula,
                          onChanged: (value) {
                            setState(() {
                              _indirimUygula = value!;
                            });
                          },
                        ),
                        const Text("İndirim Uygula"),
                        const SizedBox(width: 10),
                        if (_indirimUygula)
                          Expanded(
                            child: TextField(
                              controller: _indirimController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "İndirim Oranı (%)",
                                isDense: true,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _indirimOrani = double.tryParse(value) ?? 10;
                                });
                              },
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Fiyat detayları
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        children: [
                          _fiyatSatiri("Toplam Tutar", "${_secilenMasa!.tutar}₺"),
                          if (_indirimUygula) ...[
                            _fiyatSatiri(
                              "İndirim (%${_indirimOrani.toStringAsFixed(0)})",
                              "-${(_secilenMasa!.tutar * _indirimOrani / 100).toStringAsFixed(2)}₺",
                              renk: Colors.red,
                            ),
                            const Divider(),
                            _fiyatSatiri(
                              "Ödenecek Tutar",
                              "${(_secilenMasa!.tutar * (1 - _indirimOrani / 100)).toStringAsFixed(2)}₺",
                              buyuk: true,
                            ),
                          ],
                        ],
                      ),
                    ),

                    const Spacer(),

                    // Ödeme butonu
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: renk5Ana,
                          foregroundColor: renk6Yazi,
                        ),
                        onPressed: _odemeYap,
                        child: const Text("Ödemeyi Tamamla"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _fiyatSatiri(String etiket, String deger, {Color? renk, bool buyuk = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            etiket,
            style: TextStyle(
              fontWeight: buyuk ? FontWeight.bold : FontWeight.normal,
              fontSize: buyuk ? 16 : 14,
            ),
          ),
          Text(
            deger,
            style: TextStyle(
              fontWeight: buyuk ? FontWeight.bold : FontWeight.normal,
              fontSize: buyuk ? 16 : 14,
              color: renk,
            ),
          ),
        ],
      ),
    );
  }

  void _odemeYap() {
    final indirimliTutar = _indirimUygula
        ? _secilenMasa!.tutar * (1 - _indirimOrani / 100)
        : _secilenMasa!.tutar.toDouble();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Ödeme Onayı"),
        content: Text(
          "${_secilenMasa!.isim} için ${indirimliTutar.toStringAsFixed(2)}₺ tutarında $_secilenOdemeTipi ödemesi alındı.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _doluMasalar.removeWhere((masa) => masa.isim == _secilenMasa!.isim);
                _secilenMasa = null;
              });
            },
            child: const Text("Tamam"),
          ),
        ],
      ),
    );
  }
}