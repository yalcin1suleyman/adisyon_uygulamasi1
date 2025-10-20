import 'package:flutter/material.dart';
import 'masa_bilgi.dart';
import 'renkler.dart';
import 'package:tasarim_calismasi_adisyon1/l10n/app_localizations.dart'; // Çoklu dil desteği için eklendi
import 'package:tasarim_calismasi_adisyon1/main.dart'; // ResponsiveHelper için eklendi

class MasaDuzenleSayfasi extends StatefulWidget {
  final MasaBilgi masa;
  final void Function(MasaBilgi) onGuncelle;

  const MasaDuzenleSayfasi({super.key, required this.masa, required this.onGuncelle});

  @override
  State<MasaDuzenleSayfasi> createState() => _MasaDuzenleSayfasiState();
}

class _MasaDuzenleSayfasiState extends State<MasaDuzenleSayfasi> {
  late TextEditingController _isimController;
  late TextEditingController _saatController;
  late TextEditingController _tutarController;
  String _seciliDurum = "Boş";

  @override
  void initState() {
    super.initState();
    _isimController = TextEditingController(text: widget.masa.isim);
    _saatController = TextEditingController(text: widget.masa.saat);
    _tutarController = TextEditingController(text: widget.masa.tutar.toString());
    _seciliDurum = widget.masa.durum;
  }

  @override
  void dispose() {
    _isimController.dispose();
    _saatController.dispose();
    _tutarController.dispose();
    super.dispose();
  }

  void _kaydet() {
    final yeniMasa = MasaBilgi(
      _isimController.text,
      _seciliDurum,
      _saatController.text,
      int.tryParse(_tutarController.text) ?? 0,
    );
    widget.onGuncelle(yeniMasa);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // Çeviriler için AppLocalizations nesnesini alalım
    final l10n = AppLocalizations.of(context)!;
    
    // Durum seçeneklerini çevirelim
    final durumlar = [l10n.bos, l10n.dolu, l10n.hazirlaniyor];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.masaDuzenle, style: TextStyle(color: renk6Yazi)),
        backgroundColor: renk5Ana,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _isimController,
              decoration: InputDecoration(labelText: l10n.masaAdi),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _seciliDurum,
              items: durumlar
                  .map((durum) => DropdownMenuItem(value: _durumCevir(durum), child: Text(durum)))
                  .toList(),
              onChanged: (deger) => setState(() => _seciliDurum = deger!),
              decoration: InputDecoration(labelText: l10n.durum),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _saatController,
              decoration: InputDecoration(labelText: l10n.saat),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _tutarController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: l10n.tutar),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: renk5Ana,
                foregroundColor: renk6Yazi,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: _kaydet, 
              child: Text(l10n.kaydet)
            ),
          ],
        ),
      ),
    );
  }
  
  // Durum çevirisi
  String _durumCevir(String durum) {
    final l10n = AppLocalizations.of(context)!;
    
    if (durum == l10n.bos) return "Boş";
    if (durum == l10n.dolu) return "Dolu";
    if (durum == l10n.hazirlaniyor) return "Hazırlanıyor";
    return durum;
  }
}