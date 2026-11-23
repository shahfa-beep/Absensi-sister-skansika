import 'package:flutter/material.dart';

class RegistrasiWajahPage extends StatefulWidget {
  const RegistrasiWajahPage({super.key});

  @override
  State<RegistrasiWajahPage> createState() =>
      _RegistrasiWajahPageState();
}

class _RegistrasiWajahPageState
    extends State<RegistrasiWajahPage> {
  bool sudahTerdaftar = true;

  final Color hijau = const Color(0xFF91BFAF);

  void daftarWajah() {
    if (sudahTerdaftar) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
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
                  'Wajah Sudah Terdaftar!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Kamu sudah memiliki data wajah untuk melakukan presensi.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: hijau,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Mengerti'),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      setState(() {
        sudahTerdaftar = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAF9),

      appBar: AppBar(
        title: const Text(
          'Registrasi Wajah',
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
            const SizedBox(height: 15),

            Container(
              height: 220,
              width: 220,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF4F0),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: hijau,
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.face_retouching_natural,
                size: 125,
                color: Color(0xFF91BFAF),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Registrasi Wajah Siswa',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF263B34),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Daftarkan wajah kamu agar dapat menggunakan fitur presensi wajah.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
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
                children: [
                  const Text(
                    'Status Registrasi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Icon(
                    sudahTerdaftar
                        ? Icons.check_circle
                        : Icons.warning_amber_rounded,
                    color: sudahTerdaftar
                        ? Colors.green
                        : Colors.orange,
                    size: 35,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    sudahTerdaftar
                        ? 'Wajah Sudah Terdaftar'
                        : 'Belum Terdaftar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: sudahTerdaftar
                          ? Colors.green
                          : Colors.orange,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: daftarWajah,
                style: ElevatedButton.styleFrom(
                  backgroundColor: hijau,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'DAFTAR WAJAH',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Pastikan wajah terlihat jelas saat proses registrasi.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}