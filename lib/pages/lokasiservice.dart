import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

class LokasiService {
  final Location _location = Location();

  Future<LocationData?> ambilLokasi() async {
    // 1. Periksa izin lokasi
    ph.PermissionStatus izin =
    await ph.Permission.locationWhenInUse.status;

if (izin.isDenied) {
  izin = await ph.Permission.locationWhenInUse.request();
}

if (izin.isPermanentlyDenied) {
  await ph.openAppSettings();
  return null;
}

if (!izin.isGranted) {
  return null;
}

    // 2. Periksa apakah GPS aktif
    bool gpsAktif = await _location.serviceEnabled();

    if (!gpsAktif) {
      gpsAktif = await _location.requestService();
    }

    if (!gpsAktif) {
      return null;
    }

    // 3. Ambil koordinat lokasi
    try {
      final lokasi = await _location.getLocation();
      return lokasi;
    } catch (e) {
      return null;
    }
  }
}