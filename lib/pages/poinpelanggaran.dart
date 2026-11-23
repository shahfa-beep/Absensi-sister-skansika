import 'package:flutter/material.dart';

class PoinPelanggaranPage extends StatelessWidget {
  const PoinPelanggaranPage({super.key});

  final Color hijau = const Color(0xFF91BFAF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      appBar: AppBar(
        title: const Text('Poin Pelanggaran'),
        backgroundColor: hijau,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.verified_user,
                    size: 75,
                    color: hijau,
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Total Poin Pelanggaran',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    '0',
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A9B78),
                    ),
                  ),

                  const Text(
                    'Poin',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F4EC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Tidak Ada Pelanggaran',
                      style: TextStyle(
                        color: Color(0xFF39845F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Catatan Kedisiplinan',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: hijau,
                      ),
                      const SizedBox(width: 10),
                      const Text('Tahun Ajaran 2026/2027'),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 45,
                          color: hijau,
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'Belum Ada Catatan Pelanggaran',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          'Tetap jaga kedisiplinan dan tata tertib sekolah.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                      ],
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