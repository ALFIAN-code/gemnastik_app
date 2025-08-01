# Hand Detection Implementation

## Overview
Implementasi deteksi tangan menggunakan MediaPipe dan Google ML Kit untuk aplikasi Flutter. Fitur ini memungkinkan deteksi tangan secara realtime dengan visualisasi landmark dan deteksi gesture.

## Features

### 1. Real-time Hand Detection
- Deteksi tangan menggunakan kamera front-facing
- Visualisasi 21 landmark tangan (sesuai MediaPipe)
- Deteksi tangan kiri dan kanan secara terpisah

### 2. Gesture Recognition
- Deteksi gesture sederhana:
  - Peace sign (jari telunjuk dan tengah terangkat)
  - Thumbs up (jempol terangkat)
  - Fist (semua jari menekuk)
  - Hand raised/lowered

### 3. Visual Feedback
- Overlay landmark pada preview kamera
- Koneksi antar landmark untuk membentuk struktur tangan
- Indikator gesture yang terdeteksi
- Confidence score untuk setiap deteksi

## Implementation Details

### Files Structure
```
lib/
├── utils/
│   ├── simple_hand_detector.dart     # Simulasi deteksi tangan
│   └── pose_hand_detector.dart       # Implementasi dengan Google ML Kit
├── widgets/
│   └── hand_landmark_overlay.dart    # Widget untuk visualisasi landmark
└── view/
    └── comunicate_page.dart          # Halaman utama dengan fitur deteksi
```

### Key Components

#### 1. SimpleHandDetector
- Simulasi deteksi tangan untuk testing
- Generate 21 landmark acak
- Deteksi gesture berdasarkan posisi landmark

#### 2. PoseHandDetector
- Menggunakan Google ML Kit Pose Detection
- Extract hand landmarks dari pose detection
- Real-time processing dengan InputImage

#### 3. HandLandmarkOverlay
- CustomPaint untuk menggambar landmark
- Koneksi antar landmark sesuai MediaPipe
- Warna berbeda untuk tangan kiri/kanan

## Usage

### Basic Usage
```dart
// Initialize detector
final detector = SimpleHandDetector();

// Detect hands
final results = await detector.detectHands();

// Detect gesture
final gesture = detector.detectGesture(results.first.landmarks);
```

### Integration with Camera
```dart
// In your camera widget
Stack(
  children: [
    CameraPreview(controller),
    HandLandmarkOverlay(
      handResults: handResults,
      cameraSize: cameraSize,
    ),
  ],
)
```

## Dependencies

```yaml
dependencies:
  camera: ^0.11.2
  permission_handler: ^12.0.1
  google_mlkit_pose_detection: ^0.10.0
  google_mlkit_commons: ^0.6.1
```

## Future Enhancements

### 1. MediaPipe Integration
- Implementasi model MediaPipe Hand Landmark
- TensorFlow Lite model untuk deteksi tangan
- Real-time processing dengan native performance

### 2. Advanced Gesture Recognition
- Machine learning untuk gesture recognition
- Custom gesture training
- Sign language recognition

### 3. Performance Optimization
- GPU acceleration
- Model quantization
- Background processing

## Setup Instructions

1. Install dependencies:
```bash
flutter pub get
```

2. Add camera permissions to Android/iOS:
   - Android: `android/app/src/main/AndroidManifest.xml`
   - iOS: `ios/Runner/Info.plist`

3. Run the app:
```bash
flutter run
```

## Troubleshooting

### Common Issues

1. **Camera Permission Denied**
   - Ensure camera permissions are properly configured
   - Check platform-specific permission handling

2. **Model Loading Failed**
   - Verify model files are in assets folder
   - Check TensorFlow Lite compatibility

3. **Performance Issues**
   - Reduce input image resolution
   - Use lower precision models
   - Implement frame skipping

## Contributing

Untuk menambahkan fitur baru:

1. Create new detector class extending base interface
2. Implement required methods
3. Add tests for new functionality
4. Update documentation

## License

This implementation is part of the Gemnastik App project. 