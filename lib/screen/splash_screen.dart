import 'package:flutter/material.dart';
import 'dart:async';
import 'package:view_ref/main_screen.dart'; // kendi dosya yoluna göre düzenle

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 2 saniye bekle, sonra Dashboard'a yönlendir
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Dashboard()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // İsteğe göre değiştir
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo veya simge
            const FlutterLogo(size: 100), // Yerine kendi logonu koyabilirsin
            const SizedBox(height: 20),
            Text(
              "ViewRef App",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
