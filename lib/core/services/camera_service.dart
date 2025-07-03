import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraService {
  CameraController? _controller;
  Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status == PermissionStatus.granted;
  }

  Future<CameraController> initializeCamera() async {
    try {
      if (_controller != null && _controller!.value.isInitialized) {
        return _controller!;
      }
    } catch (E) {
      throw Exception(E);
    }
    final hasPermission = await requestCameraPermission();
    if (!hasPermission) {
      throw Exception("Camera permission not granted");
    }
    final camera = await availableCameras();
    if (camera.isEmpty) {
      throw Exception("No cameras available");
    }
    _controller = CameraController(
      camera.first,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _controller!.initialize();
    return _controller!;
  }

  CameraController get controller => _controller!;

  Future<void> dispose() async {
    await _controller!.dispose();
  }

  Future<XFile> takePicture() async {
    if (!_controller!.value.isInitialized) {
      throw Exception("Camera is not initialized");
    }
    return await _controller!.takePicture();
  }
}
