import 'package:flutter/material.dart';

class PerizinanPage extends StatefulWidget {
  const PerizinanPage({super.key});

  @override
  State<PerizinanPage> createState() => _PerizinanPageState();
}

class _PerizinanPageState extends State<PerizinanPage> {
  final Color hijau = const Color(0xFF91BFAF);

  String jenisIzin = 'Sakit';
  DateTime tanggalIzin = DateTime.now();

  final TextEditingController alasanController =
      TextEditingController();

  void ajukanIzin() {
    if (alasanController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Alasan izin harus diisi.'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pengajuan Berhasil'),
        content: const Text(
          'Pengajuan izin kamu berhasil dibuat dan sedang menunggu persetujuan.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                alasanController.clear();
                jenisIzin = 'Sakit';
                tanggalIzin = DateTime.now();
              });
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    alasanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      appBar: AppBar(
        title: const Text('Ajuan Perizinan'),
        backgroundColor: hijau,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Formulir Pengajuan Izin',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Silakan lengkapi data pengajuan izin berikut.',
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 22),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jenis Izin',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  DropdownButtonFormField<String>(
                    value: jenisIzin,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'Sakit',
                        child: Text('Sakit'),
                      ),
                      DropdownMenuItem(
                        value: 'Izin',
                        child: Text('Izin Keperluan'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          jenisIzin = value;
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Tanggal Izin',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  InkWell(
                    onTap: () async {
                      final pilih = await showDatePicker(
                        context: context,
                        initialDate: tanggalIzin,
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2030),
                      );

                      if (pilih != null) {
                        setState(() {
                          tanggalIzin = pilih;
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
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
                            '${tanggalIzin.day}/${tanggalIzin.month}/${tanggalIzin.year}',
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Keterangan / Alasan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    controller: alasanController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Tuliskan alasan pengajuan izin...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: ajukanIzin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: hijau,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Kirim Pengajuan',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}