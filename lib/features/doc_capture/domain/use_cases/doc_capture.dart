import 'package:camera/camera.dart';
import 'package:redact_safe/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:redact_safe/core/error/failure.dart';
import 'package:redact_safe/features/doc_capture/domain/repositories/doc_capture_repository.dart';

class DocCapture implements UseCase<String,DocCaptureParams> {
  final DocCaptureRepository _docCaptureRepository;
  DocCapture(this._docCaptureRepository);
  @override
  Future<Either<Failure,String>> call(DocCaptureParams params) async {
    return _docCaptureRepository.captureDocument(params.cameraController);
  }

}

class DocCaptureParams {
  final CameraController cameraController;

  DocCaptureParams({required this.cameraController});
}


