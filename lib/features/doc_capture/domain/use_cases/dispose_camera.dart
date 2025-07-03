import 'package:camera/camera.dart';
import 'package:fpdart/fpdart.dart';
import 'package:redact_safe/core/error/failure.dart';
import 'package:redact_safe/core/usecase/usecase.dart';
import 'package:redact_safe/features/doc_capture/domain/repositories/doc_capture_repository.dart';

class DisposeCamera implements UseCase<void, CameraController> {
  final DocCaptureRepository docCaptureRepository;

  DisposeCamera({required this.docCaptureRepository});

  @override
  Future<Either<Failure, void>> call(CameraController cameraController) async {
    return await docCaptureRepository.disposeCamera(cameraController);
  }
}
