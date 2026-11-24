import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class KameraPage extends StatefulWidget {
  const KameraPage({super.key});

  @override
  State<KameraPage> createState() => _KameraPageState();
}

class _KameraPageState extends State<KameraPage> {
  CameraController? controller;
  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    bukaKamera();
  }

  Future<void> bukaKamera() async {
    try {
      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        throw Exception('Kamera tidak ditemukan');
      }

      final depan = cameras.where(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      );

      final selected = depan.isNotEmpty ? depan.first : cameras.first;

      final cameraController = CameraController(
        selected,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      controller = cameraController;
      await cameraController.initialize();

      if (!mounted) return;

      setState(() {
        loading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        loading = false;
        error = e.toString();
      });
    }
  }

  Future<void> ambilFoto() async {
    if (controller == null || !controller!.value.isInitialized) {
      return;
    }

    try {
      final foto = await controller!.takePicture();

      if (!mounted) return;

      Navigator.pop(context, foto);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Gagal mengambil foto: $e')));
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Verifikasi Wajah'),
        backgroundColor: const Color(0xFF91BFAF),
      ),
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : error != null
            ? Text(error!, style: const TextStyle(color: Colors.white))
            : Column(
                children: [
                  Expanded(child: CameraPreview(controller!)),
                  const SizedBox(height: 15),
                  const Text(
                    'Posisikan wajah di tengah kamera',
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    onPressed: ambilFoto,
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 55,
                      color: Color(0xFF91BFAF),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
      ),
    );
  }
}
