import 'package:camera/camera.dart';
import 'package:fpdart/fpdart.dart';
import 'package:redact_safe/core/error/failure.dart';
import 'package:redact_safe/core/params/no_params.dart';
import 'package:redact_safe/core/usecase/usecase.dart';
import 'package:redact_safe/features/doc_capture/domain/repositories/doc_capture_repository.dart';

class InitializeCamera implements UseCase<CameraController, NoParams> {
  final DocCaptureRepository _docCaptureRepository;
  InitializeCamera(this._docCaptureRepository);
  @override
  Future<Either<Failure,CameraController>> call(NoParams noParams) async {
    return _docCaptureRepository.initializeCamera();
    }

}

