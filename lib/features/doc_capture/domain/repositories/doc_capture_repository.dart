import 'package:camera/camera.dart';
import 'package:fpdart/fpdart.dart';
import 'package:redact_safe/core/error/failure.dart';

abstract class DocCaptureRepository {

  Future<Either<Failure,CameraController>> initializeCamera();
  Future<Either<Failure,String>> captureDocument(CameraController cameraController);
  Future<Either<Failure,void>> disposeCamera(CameraController cameraController);

}