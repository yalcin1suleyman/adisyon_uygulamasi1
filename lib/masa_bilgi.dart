import 'package:flutter/material.dart';

class MasaBilgi {
  final String isim;
  final String durum;
  final String saat;
  final int tutar;

  MasaBilgi(this.isim, this.durum, this.saat, this.tutar);
}

class MasaKarti extends StatelessWidget {
  final MasaBilgi masa;

  const MasaKarti({super.key, required this.masa});

  @override
  Widget build(BuildContext context) {
    Color durumRenk;
    switch (masa.durum) {
      case "Dolu":
        durumRenk = Colors.red;
        break;
      case "Boş":
        durumRenk = Colors.green;
        break;
      case "Hazırlanıyor":
        durumRenk = Colors.orange;
        break;
      default:
        durumRenk = Colors.grey;
    }

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 12, color: durumRenk),
                const SizedBox(width: 4),
                Text(masa.isim, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 6),
            Text(masa.durum, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 2),
            Text(masa.saat, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 6),
            Text("${masa.tutar}₺", style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}