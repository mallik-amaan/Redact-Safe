import 'package:redact_safe/features/doc_capture/domain/use_cases/dispose_camera.dart';
import 'package:redact_safe/features/doc_capture/domain/use_cases/doc_capture.dart';
import 'package:redact_safe/features/doc_capture/domain/use_cases/initialize_camera.dart';

class DocScanUsecaseBundle {
  final DocCapture docCapture;
  final InitializeCamera initializeCamera;
  final DisposeCamera disposeCamera;
  DocScanUsecaseBundle({
    required this.docCapture,
    required this.initializeCamera,
    required this.disposeCamera,
  });
}
