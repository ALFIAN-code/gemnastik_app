import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

List<CameraDescription> cameras = [];

class ComunicatePage2 extends StatefulWidget {
  const ComunicatePage2({super.key});

  @override
  State<ComunicatePage2> createState() => _ComunicatePageState();
}

class _ComunicatePageState extends State<ComunicatePage2> {
  CameraController? _cameraController;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    // Minta izin kamera
    final status = await Permission.camera.request();

    if (status != PermissionStatus.granted) {
      // Tampilkan pesan atau fallback
      throw Exception('Izin kamera ditolak');
    }
    final frontCamera = cameras.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.front,
      orElse: () {
        if (cameras.isEmpty) {
          throw Exception('Tidak ada kamera ditemukan di perangkat');
        }
        return cameras.first;
      },
    );

    _cameraController = CameraController(
      frontCamera,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    await _cameraController!.initialize();
    setState(() => _isCameraInitialized = true);
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(''),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 45,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Row(
              children: [
                Icon(Icons.videocam_outlined, color: Colors.red.shade900),
                SizedBox(width: 10),
                Text(
                  'Kamera aktif',
                  style: TextStyle(color: Colors.red.shade900),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Transkrip Isyarat',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    _isCameraInitialized
                        ? SizedBox(
                          width:
                              double.infinity, // Lebar area clip yang diinginkan
                          height: 400, // Tinggi area clip yang diinginkan
                          child: ClipRect(
                            child: OverflowBox(
                              // Optional: Memastikan CameraPreview tidak terpengaruh batas SizedBox saat rasio aspek berbeda
                              alignment: Alignment.center,
                              child: FittedBox(
                                fit:
                                    BoxFit
                                        .fitWidth, // Atau BoxFit lainnya sesuai kebutuhan
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context)
                                          .size
                                          .width, // Lebar penuh untuk mempertahankan rasio
                                  child: CameraPreview(_cameraController!),
                                ),
                              ),
                            ),
                          ),
                        )
                        : Container(
                          color: Colors.black12,
                          child: const Center(child: CircularProgressIndicator()),
                        ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "halo, apa bagaimana kabarmu hari ini?",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFECE1F1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Transkrip Suara',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: const Text(
                          'hallo, kabarku baik, bagaimana denganmu?',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.deepPurple,
                                ),
                                child: Icon(
                                  Icons.mic,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
