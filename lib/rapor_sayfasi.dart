import 'package:flutter/material.dart';
import 'package:tasarim_calismasi_adisyon1/renkler.dart';

class RaporSayfasi extends StatefulWidget {
  const RaporSayfasi({super.key});

  @override
  State<RaporSayfasi> createState() => _RaporSayfasiState();
}

class _RaporSayfasiState extends State<RaporSayfasi> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _secilenTarih = "Bugün";
  final List<String> _tarihSecenekleri = ["Bugün", "Bu Hafta", "Bu Ay", "Tümü"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
          "Raporlar",
          style: TextStyle(color: renk6Yazi, fontFamily: "yaziTipi2"),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: renk6Yazi,
          unselectedLabelColor: renk6Yazi.withOpacity(0.7),
          indicatorColor: renk6Yazi,
          tabs: const [
            Tab(text: "Satış Raporu"),
            Tab(text: "Ürün Raporu"),
            Tab(text: "Masa Raporu"),
          ],
        ),
      ),
      body: Column(
        children: [
          // Tarih seçimi
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text("Tarih Aralığı: ", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _secilenTarih,
                  items: _tarihSecenekleri
                      .map((tarih) => DropdownMenuItem(value: tarih, child: Text(tarih)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _secilenTarih = value!;
                    });
                  },
                ),
              ],
            ),
          ),

          // Tab içerikleri
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _satisRaporuTab(),
                _urunRaporuTab(),
                _masaRaporuTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _satisRaporuTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Özet kartları
          Row(
            children: [
              Expanded(child: _ozetKarti("Toplam Satış", "1.240₺", Icons.monetization_on)),
              const SizedBox(width: 10),
              Expanded(child: _ozetKarti("Sipariş Sayısı", "28", Icons.receipt_long)),
              const SizedBox(width: 10),
              Expanded(child: _ozetKarti("Ortalama Sipariş", "44.3₺", Icons.calculate)),
            ],
          ),

          const SizedBox(height: 20),

          // Grafik (temsili)
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Satış Grafiği\n$_secilenTarih",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Satış listesi
          const Text("Son Satışlar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: renk5Ana,
                    child: Text("M${index + 1}", style: TextStyle(color: renk6Yazi)),
                  ),
                  title: Text("Masa ${index + 1}"),
                  subtitle: Text("${DateTime.now().hour}:${DateTime.now().minute} - ${(index + 1) * 15} dakika"),
                  trailing: Text("${(index + 1) * 50 + 30}₺", style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _urunRaporuTab() {
    final List<Map<String, dynamic>> urunler = [
      {"ad": "Çay", "adet": 42, "toplam": 630.0},
      {"ad": "Kahve", "adet": 28, "toplam": 980.0},
      {"ad": "Türk Kahvesi", "adet": 15, "toplam": 450.0},
      {"ad": "Ayran", "adet": 20, "toplam": 400.0},
      {"ad": "Köfte", "adet": 12, "toplam": 1440.0},
      {"ad": "Baklava", "adet": 8, "toplam": 600.0},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Özet kartları
          Row(
            children: [
              Expanded(child: _ozetKarti("Toplam Ürün", "125", Icons.shopping_bag)),
              const SizedBox(width: 10),
              Expanded(child: _ozetKarti("En Çok Satan", "Çay", Icons.star)),
            ],
          ),

          const SizedBox(height: 20),

          // Ürün listesi
          const Text("Ürün Satış Raporu", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),

          DataTable(
            columnSpacing: 20,
            columns: const [
              DataColumn(label: Text("Ürün", style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text("Adet", style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text("Toplam", style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            rows: urunler.map((urun) {
              return DataRow(cells: [
                DataCell(Text(urun["ad"])),
                DataCell(Text(urun["adet"].toString())),
                DataCell(Text("${urun["toplam"].toStringAsFixed(2)}₺")),
              ]);
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Grafik (temsili)
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Ürün Satış Grafiği\n$_secilenTarih",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _masaRaporuTab() {
    final List<Map<String, dynamic>> masalar = [
      {"no": 1, "kullanim": 8, "sure": 240, "ciro": 480.0},
      {"no": 4, "kullanim": 6, "sure": 180, "ciro": 350.0},
      {"no": 2, "kullanim": 5, "sure": 150, "ciro": 280.0},
      {"no": 6, "kullanim": 7, "sure": 210, "ciro": 420.0},
      {"no": 3, "kullanim": 4, "sure": 120, "ciro": 240.0},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Özet kartları
          Row(
            children: [
              Expanded(child: _ozetKarti("Toplam Masa", "12", Icons.table_restaurant)),
              const SizedBox(width: 10),
              Expanded(child: _ozetKarti("Ortalama Süre", "45 dk", Icons.timer)),
            ],
          ),

          const SizedBox(height: 20),

          // Masa listesi
          const Text("Masa Kullanım Raporu", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),

          DataTable(
            columnSpacing: 20,
            columns: const [
              DataColumn(label: Text("Masa", style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text("Kullanım", style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text("Ort. Süre", style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text("Ciro", style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            rows: masalar.map((masa) {
              return DataRow(cells: [
                DataCell(Text("Masa ${masa["no"]}")),
                DataCell(Text("${masa["kullanim"]} kez")),
                DataCell(Text("${masa["sure"] ~/ masa["kullanim"]} dk")),
                DataCell(Text("${masa["ciro"].toStringAsFixed(2)}₺")),
              ]);
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Grafik (temsili)
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Masa Kullanım Grafiği\n$_secilenTarih",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ozetKarti(String baslik, String deger, IconData ikon) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(ikon, color: renk5Ana, size: 28),
            const SizedBox(height: 8),
            Text(baslik, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            Text(deger, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}