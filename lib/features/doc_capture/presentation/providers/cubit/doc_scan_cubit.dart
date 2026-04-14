import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:redact_safe/core/params/no_params.dart';
import 'package:redact_safe/features/doc_capture/domain/use_cases/doc_capture.dart';
import 'package:redact_safe/features/doc_capture/domain/use_cases/doc_scan_usecase_bundle.dart';

part 'doc_scan_state.dart';

class DocScanCubit extends Cubit<DocScanState> {
  final DocScanUsecaseBundle docScanUsecaseBundle;
  late CameraController _cameraController;
  DocScanCubit({required this.docScanUsecaseBundle}) : super(DocScanInitial());

  void initializeCamera() async {
    emit(DocScanLoading());
    final result = await docScanUsecaseBundle.initializeCamera(NoParams());
    result.fold((failure) => emit(DocScanError(failure.message)), (
      cameraController,
    ) {
      emit(DocScanCameraInitialized(cameraController));
      _cameraController = cameraController;
    });
  }

  void captureDocument() {
    if (_cameraController.value.isInitialized) {
      emit(DocScanLoading());
      docScanUsecaseBundle
          .docCapture(DocCaptureParams(cameraController: _cameraController))
          .then((result) {
            result.fold(
              (failure) => emit(DocScanError(failure.message)),
              (filePath) => emit(DocScanSuccess(filePath)),
            );
          });
    } else {
      emit(DocScanError("Camera is not initialized"));
    }
  }

  void disposeCamera() async {
    // Logic to dispose camera
    final result = await docScanUsecaseBundle.disposeCamera(_cameraController);
    result.fold(
      (failure) => emit(DocScanError(failure.message)),
      (_) => emit(DocScanCameraDisposed()),
    );
  }

  void completeCapture() {
    emit(DocScanComplete());
  }
}
