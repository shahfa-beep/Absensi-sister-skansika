import 'package:flutter/material.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    const hijau = Color(0xFF91BFAF);

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAF9),

      appBar: AppBar(
        title: const Text(
          'Riwayat Absensi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF263B34),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rekap Kehadiran',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: hijau,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                children: [
                  Text(
                    'Total Kehadiran',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    '361 Hari',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    'Tahun Ajaran 2026/2027',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: statistikCard(
                    'Hadir',
                    '361',
                    Colors.green,
                    Icons.check_circle,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: statistikCard(
                    'Sakit',
                    '3',
                    Colors.orange,
                    Icons.medical_services,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: statistikCard(
                    'Izin',
                    '1',
                    Colors.blue,
                    Icons.assignment_turned_in,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: statistikCard(
                    'Alfa',
                    '0',
                    Colors.red,
                    Icons.cancel,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'Riwayat Terbaru',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            itemAbsensi(
              '23 November 2026',
              'Hadir',
              '07.00 WIB',
              Colors.green,
            ),

            itemAbsensi(
              '22 November 2026',
              'Hadir',
              '06.55 WIB',
              Colors.green,
            ),

            itemAbsensi(
              '21 November 2026',
              'Sakit',
              '-',
              Colors.orange,
            ),

            itemAbsensi(
              '20 November 2026',
              'Izin',
              '-',
              Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget statistikCard(
    String judul,
    String jumlah,
    Color warna,
    IconData ikon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            ikon,
            color: warna,
            size: 27,
          ),

          const SizedBox(height: 12),

          Text(
            jumlah,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            judul,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget itemAbsensi(
    String tanggal,
    String status,
    String waktu,
    Color warna,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            Icons.calendar_month,
            color: warna,
            size: 27,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tanggal,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  waktu,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Text(
            status,
            style: TextStyle(
              color: warna,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}