import 'package:flutter/material.dart';
import '../auth/loginpage.dart';

void main() {
  runApp(const AbsensiSaya());
}

class AbsensiSaya extends StatelessWidget {
  const AbsensiSaya({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AbsensiSaya',
      theme: ThemeData(
        primaryColor: const Color(0xFF91BFAF),
        scaffoldBackgroundColor: const Color(0xFFF7FAF9),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}