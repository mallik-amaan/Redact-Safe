import 'package:camera/camera.dart';
import 'package:fpdart/fpdart.dart';
import 'package:redact_safe/core/error/failure.dart';
import 'package:redact_safe/core/services/camera_service.dart';
import 'package:redact_safe/features/doc_capture/domain/repositories/doc_capture_repository.dart';

class DocCaptureRepositoryImpl extends DocCaptureRepository {
  final CameraService _cameraService;
  DocCaptureRepositoryImpl({required CameraService cameraService})
    : _cameraService = cameraService;
  @override
  Future<Either<Failure, CameraController>> initializeCamera() async {
    try {
      final controller = await _cameraService.initializeCamera();
      return Right(controller);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> captureDocument(
    CameraController cameraController,
  ) async {
    try {
      final file = await _cameraService.takePicture();
      return Right(file.path);
    } catch (E) {
      return Left(Failure(E.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> disposeCamera(
    CameraController cameraController,
  ) async {
    try {
      await _cameraService.dispose();
      return Right(null);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }
}
