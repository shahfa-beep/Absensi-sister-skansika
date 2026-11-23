import 'package:flutter/material.dart';

class DataDiriPage extends StatelessWidget {
  const DataDiriPage({super.key});

  @override
  Widget build(BuildContext context) {
    const hijau = Color(0xFF91BFAF);

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAF9),

      appBar: AppBar(
        title: const Text(
          'Data Diri Siswa',
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
          children: [
            const SizedBox(height: 10),

            const CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xFFEAF4F0),
              child: Icon(
                Icons.person,
                size: 60,
                color: hijau,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Luthfiah Shahfa Nur Khasanah',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Siswa SMK Negeri 1 Bukateja',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 30),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Informasi Pribadi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            dataItem('Nama Lengkap', 'Luthfiah Shahfa Nur Khasanah'),
            dataItem('NIS', '12345678'),
            dataItem('Jenis Kelamin', 'Perempuan'),
            dataItem('Tempat, Tanggal Lahir', 'Purwokerto, 01 Januari 2009'),
            dataItem('Alamat', 'Purwokerto'),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Informasi Sekolah',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            dataItem('Sekolah', 'SMK Negeri 1 Bukateja'),
            dataItem('Kelas', 'XI'),
            dataItem('Jurusan', 'Rekayasa Perangkat Lunak'),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Fitur edit data diri belum diaktifkan.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit Data Diri'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: hijau,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dataItem(String judul, String isi) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            judul,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 7),

          Text(
            isi,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF263B34),
            ),
          ),
        ],
      ),
    );
  }
}