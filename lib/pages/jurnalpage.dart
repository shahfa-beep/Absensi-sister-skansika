import 'package:flutter/material.dart';

class JurnalPage extends StatefulWidget {
  const JurnalPage({super.key});

  @override
  State<JurnalPage> createState() => _JurnalPageState();
}

class _JurnalPageState extends State<JurnalPage> {
  final Color hijau = const Color(0xFF91BFAF);

  final TextEditingController kegiatanController =
      TextEditingController();

  final TextEditingController hasilController =
      TextEditingController();

  DateTime tanggal = DateTime.now();

  List<Map<String, String>> daftarJurnal = [];

  void simpanJurnal() {
    if (kegiatanController.text.isEmpty ||
        hasilController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lengkapi semua data jurnal terlebih dahulu.'),
        ),
      );
      return;
    }

    setState(() {
      daftarJurnal.insert(0, {
        'tanggal':
            '${tanggal.day}/${tanggal.month}/${tanggal.year}',
        'kegiatan': kegiatanController.text,
        'hasil': hasilController.text,
      });
    });

    kegiatanController.clear();
    hasilController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Jurnal berhasil disimpan!'),
      ),
    );
  }

  @override
  void dispose() {
    kegiatanController.dispose();
    hasilController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      appBar: AppBar(
        title: const Text('Jurnal PKL'),
        backgroundColor: hijau,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Catatan Kegiatan PKL',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Tuliskan kegiatan yang kamu lakukan selama PKL.',
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tanggal Kegiatan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  InkWell(
                    onTap: () async {
                      final pilih = await showDatePicker(
                        context: context,
                        initialDate: tanggal,
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2030),
                      );

                      if (pilih != null) {
                        setState(() {
                          tanggal = pilih;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month, color: hijau),
                          const SizedBox(width: 10),
                          Text(
                            '${tanggal.day}/${tanggal.month}/${tanggal.year}',
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    'Kegiatan yang Dilakukan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    controller: kegiatanController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Masukkan kegiatan PKL...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    'Hasil Kegiatan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    controller: hasilController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Tuliskan hasil kegiatan...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: simpanJurnal,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: hijau,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Simpan Jurnal'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Riwayat Jurnal',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            if (daftarJurnal.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Text(
                    'Belum ada jurnal kegiatan.',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),

            ...daftarJurnal.map((jurnal) {
              return Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.menu_book, color: hijau),
                  title: Text(jurnal['kegiatan']!),
                  subtitle: Text(
                    '${jurnal['tanggal']}\n${jurnal['hasil']}',
                  ),
                  isThreeLine: true,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}