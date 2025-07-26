import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gemnastik_app/view/cominicate_page2.dart';
import 'package:gemnastik_app/view/comunicate_page.dart';
import 'package:gemnastik_app/view/welcome_page/welcome_page.dart';
import 'package:permission_handler/permission_handler.dart';

void main(List<String> args) async {
    WidgetsFlutterBinding.ensureInitialized();

  // Minta izin dulu
  final status = await Permission.camera.request();
  if (!status.isGranted) {
    runApp(const MaterialApp(
      home: Scaffold(body: Center(child: Text("Izin kamera ditolak"))),
    ));
    return;
  }
  
  // Load kamera hanya kalau sudah ada izin
  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home:Welcome1(),
    );
  }
}