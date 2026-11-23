import 'package:flutter/material.dart';

class DetailAkunPage extends StatefulWidget {
  const DetailAkunPage({super.key});

  @override
  State<DetailAkunPage> createState() =>
      _DetailAkunPageState();
}

class _DetailAkunPageState extends State<DetailAkunPage> {
  final Color hijau = const Color(0xFF91BFAF);

  final TextEditingController namaController =
      TextEditingController(text: 'Luthfiah Shahfa Nur Khasanah');

  final TextEditingController nisController =
      TextEditingController(text: '123456');

  final TextEditingController kelasController =
      TextEditingController(text: 'XI RPL 1');

  final TextEditingController usernameController =
      TextEditingController(text: 'luthfiah123');

  bool modeEdit = false;

  void simpanData() {
    setState(() {
      modeEdit = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data akun berhasil diperbarui.'),
      ),
    );
  }

  void ubahPassword() {
    final passwordLamaController =
        TextEditingController();

    final passwordBaruController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ubah Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: passwordLamaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password Lama',
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: passwordBaruController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password Baru',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                passwordLamaController.dispose();
                passwordBaruController.dispose();
              },
              child: const Text('Batal'),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: hijau,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                if (passwordLamaController.text.isEmpty ||
                    passwordBaruController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Lengkapi password terlebih dahulu.'),
                    ),
                  );
                  return;
                }

                Navigator.pop(context);

                passwordLamaController.dispose();
                passwordBaruController.dispose();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Simulasi perubahan password berhasil.',
                    ),
                  ),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  Widget kolomData({
    required String judul,
    required TextEditingController controller,
    bool bisaEdit = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            judul,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: controller,
            readOnly: !modeEdit || !bisaEdit,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF5F7F6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    nisController.dispose();
    kelasController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),

      appBar: AppBar(
        title: const Text('Detail Akun'),
        backgroundColor: hijau,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            CircleAvatar(
              radius: 45,
              backgroundColor: hijau,
              child: const Icon(
                Icons.person,
                size: 55,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Informasi Akun Siswa',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
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
                    'Data Akun',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  kolomData(
                    judul: 'Nama Lengkap',
                    controller: namaController,
                  ),

                  kolomData(
                    judul: 'Nomor Induk Siswa (NIS)',
                    controller: nisController,
                    bisaEdit: false,
                  ),

                  kolomData(
                    judul: 'Kelas',
                    controller: kelasController,
                  ),

                  kolomData(
                    judul: 'Username',
                    controller: usernameController,
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (modeEdit) {
                          simpanData();
                        } else {
                          setState(() {
                            modeEdit = true;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: hijau,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        modeEdit
                            ? 'Simpan Perubahan'
                            : 'Edit Data Akun',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.lock_outline,
                  color: hijau,
                ),
                title: const Text(
                  'Ubah Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                onTap: ubahPassword,
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}