import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'lokasiservice.dart';
import 'kamerapage.dart';

class PresensiPage extends StatefulWidget {
  const PresensiPage({super.key});

  @override
  State<PresensiPage> createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  int selectedTab = 0;

  bool presensiBerhasil = false;
  bool sedangMemuatLokasi = false;

  final Color hijau = const Color(0xFF91BFAF);
  final LokasiService lokasiService = LokasiService();

  String statusLokasi = 'Lokasi belum diperiksa';
  String? latitude;
  String? longitude;

  // CEK LOKASI
  Future<void> cekLokasi() async {
    setState(() {
      sedangMemuatLokasi = true;
      statusLokasi = 'Memeriksa lokasi...';
    });

    try {
      final lokasi = await lokasiService.ambilLokasi();

      if (!mounted) return;

      setState(() {
        sedangMemuatLokasi = false;

        if (lokasi != null &&
            lokasi.latitude != null &&
            lokasi.longitude != null) {
          latitude = lokasi.latitude.toString();
          longitude = lokasi.longitude.toString();
          statusLokasi = 'Lokasi berhasil ditemukan';
        } else {
          latitude = null;
          longitude = null;
          statusLokasi = 'Izin atau GPS belum tersedia';
        }
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        sedangMemuatLokasi = false;
        statusLokasi = 'Gagal mendapatkan lokasi';
      });
    }
  }

  // MULAI PRESENSI
  Future<void> mulaiPresensi() async {
    await cekLokasi();

    if (!mounted) return;

    if (latitude == null || longitude == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Aktifkan GPS dan berikan izin lokasi terlebih dahulu.',
          ),
        ),
      );
      return;
    }

    // MEMBUKA HALAMAN KAMERA
    final XFile? foto = await Navigator.push<XFile>(
      context,
      MaterialPageRoute(
        builder: (context) => const KameraPage(),
      ),
    );

    if (!mounted || foto == null) return;

    setState(() {
      presensiBerhasil = true;
    });

    tampilkanDialogBerhasil();
  }

  // DIALOG BERHASIL
  void tampilkanDialogBerhasil() {
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
                'Foto berhasil diambil dan lokasi berhasil ditemukan.',
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

  // TAB BUTTON
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

  // HALAMAN ABSEN
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

          // AREA VERIFIKASI WAJAH
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

          // INFORMASI LOKASI
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(0xFF91BFAF),
                      size: 28,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Lokasi Presensi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'SMK Negeri 1 Bukateja',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  statusLokasi,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                if (latitude != null && longitude != null) ...[
                  const SizedBox(height: 8),
                  Text('Latitude: $latitude'),
                  Text('Longitude: $longitude'),
                ],
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed:
                      sedangMemuatLokasi ? null : cekLokasi,
                  icon: const Icon(Icons.refresh),
                  label: Text(
                    sedangMemuatLokasi
                        ? 'Memeriksa...'
                        : 'Periksa Lokasi',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // TOMBOL PRESENSI
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed:
                  sedangMemuatLokasi ? null : mulaiPresensi,
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

  // HALAMAN RIWAYAT
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