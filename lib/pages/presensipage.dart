import 'package:flutter/material.dart';

class PresensiPage extends StatefulWidget {
  const PresensiPage({super.key});

  @override
  State<PresensiPage> createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  int selectedTab = 0;

  bool presensiBerhasil = false;

  final Color hijau = const Color(0xFF91BFAF);

  void mulaiPresensi() {
    setState(() {
      presensiBerhasil = true;
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Color(0xFF91BFAF),
                size: 65,
              ),
              const SizedBox(height: 15),
              const Text(
                'Presensi Berhasil!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Data presensi kamu berhasil dicatat.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: hijau,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Kembali'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAF9),
      appBar: AppBar(
        title: const Text(
          'Presensi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF263B34),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                tabButton('Absen', 0),
                tabButton('Riwayat', 1),
              ],
            ),
          ),

          Expanded(
            child: selectedTab == 0
                ? halamanAbsen()
                : halamanRiwayat(),
          ),
        ],
      ),
    );
  }

  Widget tabButton(String judul, int index) {
    bool aktif = selectedTab == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: aktif ? hijau : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Center(
            child: Text(
              judul,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: aktif ? hijau : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget halamanAbsen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Verifikasi Wajah',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Color(0xFF263B34),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Posisikan wajah kamu di dalam area pemindaian',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 25),

          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF4F0),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: hijau,
                width: 3,
              ),
            ),
            child: const Icon(
              Icons.face_retouching_natural,
              size: 130,
              color: Color(0xFF91BFAF),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Siap untuk melakukan presensi?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Pastikan wajah terlihat jelas dan tidak tertutup.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 25),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Color(0xFF91BFAF),
                  size: 28,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lokasi Presensi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'SMK Negeri 1 Bukateja',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: mulaiPresensi,
              style: ElevatedButton.styleFrom(
                backgroundColor: hijau,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'MULAI PRESENSI',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget halamanRiwayat() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Riwayat Presensi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        itemRiwayat('23 November 2026', 'Hadir', '07.00 WIB'),
        itemRiwayat('22 November 2026', 'Hadir', '06.55 WIB'),
        itemRiwayat('21 November 2026', 'Hadir', '07.05 WIB'),
      ],
    );
  }

  Widget itemRiwayat(
    String tanggal,
    String status,
    String waktu,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: Color(0xFF91BFAF),
            size: 28,
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
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}