import 'package:flutter/material.dart';

import 'detailakunpage.dart';
import 'datadiri.dart';
import 'registrasiwajah.dart';
import 'resetwajah.dart';
import 'jurnalpage.dart';
import 'perizinanpage.dart';
import 'statuspengajuan.dart';
import 'poinpelanggaran.dart';

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  final Color hijau = const Color(0xFF91BFAF);

  void bukaHalaman(BuildContext context, Widget halaman) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => halaman),
    );
  }

  Widget menuAkun({
    required BuildContext context,
    required IconData icon,
    required String judul,
    required Widget halaman,
  }) {
    return ListTile(
      leading: Icon(icon, color: hijau, size: 25),
      title: Text(
        judul,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: () => bukaHalaman(context, halaman),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      appBar: AppBar(
        title: const Text('Akun Saya'),
        backgroundColor: hijau,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            // PROFIL SISWA
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: hijau,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 42,
                      color: Color(0xFF91BFAF),
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Luthfiah Shahfa Nur Khasanah',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'XI RPL 1',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'NIS: 123456',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // PENGATURAN AKUN
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Pengaturan Akun',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  menuAkun(
                    context: context,
                    icon: Icons.manage_accounts,
                    judul: 'Detail Akun',
                    halaman: const DetailAkunPage(),
                  ),

                  menuAkun(
                    context: context,
                    icon: Icons.person_outline,
                    judul: 'Data Diri',
                    halaman: const DataDiriPage(),
                  ),

                  menuAkun(
                    context: context,
                    icon: Icons.face,
                    judul: 'Registrasi Wajah',
                    halaman: const RegistrasiWajahPage(),
                  ),

                  menuAkun(
                    context: context,
                    icon: Icons.face_retouching_natural,
                    judul: 'Reset Wajah',
                    halaman: const ResetWajahPage(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // MENU KEGIATAN
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Menu Lainnya',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  menuAkun(
                    context: context,
                    icon: Icons.menu_book,
                    judul: 'Jurnal PKL',
                    halaman: const JurnalPage(),
                  ),

                  menuAkun(
                    context: context,
                    icon: Icons.assignment_outlined,
                    judul: 'Ajuan Perizinan',
                    halaman: const PerizinanPage(),
                  ),

                  menuAkun(
                    context: context,
                    icon: Icons.history,
                    judul: 'Riwayat Pengajuan',
                    halaman: const StatusPengajuanPage(),
                  ),

                  menuAkun(
                    context: context,
                    icon: Icons.shield_outlined,
                    judul: 'Poin Pelanggaran',
                    halaman: const PoinPelanggaranPage(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}