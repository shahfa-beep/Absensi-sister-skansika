import 'package:flutter/material.dart';

class StatusPengajuanPage extends StatelessWidget {
  const StatusPengajuanPage({super.key});

  final Color hijau = const Color(0xFF91BFAF);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> riwayat = [
      {
        'jenis': 'Sakit',
        'tanggal': '12/11/2026',
        'alasan': 'Demam dan kurang sehat',
        'status': 'Disetujui',
      },
      {
        'jenis': 'Izin',
        'tanggal': '05/11/2026',
        'alasan': 'Keperluan keluarga',
        'status': 'Menunggu',
      },
      {
        'jenis': 'Sakit',
        'tanggal': '20/10/2026',
        'alasan': 'Tidak enak badan',
        'status': 'Ditolak',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      appBar: AppBar(
        title: const Text('Riwayat Pengajuan'),
        backgroundColor: hijau,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Riwayat Perizinan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Lihat status pengajuan izin yang telah kamu kirim.',
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: riwayat.length,
                itemBuilder: (context, index) {
                  final data = riwayat[index];

                  Color warnaStatus;

                  switch (data['status']) {
                    case 'Disetujui':
                      warnaStatus = Colors.green;
                      break;
                    case 'Ditolak':
                      warnaStatus = Colors.red;
                      break;
                    default:
                      warnaStatus = Colors.orange;
                  }

                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.description_outlined,
                              color: hijau,
                              size: 28,
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: Text(
                                data['jenis']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: warnaStatus.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                data['status']!,
                                style: TextStyle(
                                  color: warnaStatus,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Text('Tanggal: ${data['tanggal']}'),

                        const SizedBox(height: 6),

                        Text('Alasan: ${data['alasan']}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}