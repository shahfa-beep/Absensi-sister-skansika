import 'package:flutter/material.dart';

class ResetWajahPage extends StatefulWidget {
  const ResetWajahPage({super.key});

  @override
  State<ResetWajahPage> createState() =>
      _ResetWajahPageState();
}

class _ResetWajahPageState extends State<ResetWajahPage> {
  final Color hijau = const Color(0xFF91BFAF);

  bool wajahTerdaftar = true;

  void resetWajah() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Reset'),
        content: const Text(
          'Apakah kamu yakin ingin mereset registrasi wajah?',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Batal'),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: hijau,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              setState(() {
                wajahTerdaftar = false;
              });

              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Status registrasi wajah berhasil direset.',
                  ),
                ),
              );
            },
            child: const Text('Ya, Reset'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),

      appBar: AppBar(
        title: const Text('Reset Wajah'),
        backgroundColor: hijau,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 35),

            Icon(
              Icons.face_retouching_natural,
              size: 100,
              color: hijau,
            ),

            const SizedBox(height: 25),

            const Text(
              'Reset Registrasi Wajah',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Reset wajah digunakan untuk menghapus '
              'status registrasi wajah agar siswa dapat '
              'melakukan registrasi ulang.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: hijau,
                    size: 27,
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      wajahTerdaftar
                          ? 'Status: Wajah sudah terdaftar'
                          : 'Status: Wajah belum terdaftar',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:
                    wajahTerdaftar ? resetWajah : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: hijau,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Reset Wajah',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}