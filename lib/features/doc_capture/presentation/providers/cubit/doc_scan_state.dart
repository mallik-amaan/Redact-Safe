part of 'doc_scan_cubit.dart';

sealed class DocScanState extends Equatable {
  const DocScanState();

  @override
  List<Object> get props => [];
}

final class DocScanInitial extends DocScanState {}
//loading state
final class DocScanLoading extends DocScanState {}
//scan successful, returns the file path
final class DocScanSuccess extends DocScanState {
  final String filePath;

  const DocScanSuccess(this.filePath);

  @override
  List<Object> get props => [filePath];
}

//error state, returns the error message
final class DocScanError extends DocScanState {
  final String message;

  const DocScanError(this.message);

  @override
  List<Object> get props => [message];
}

//camera initialized state, returns the camera controller
final class DocScanCameraInitialized extends DocScanState {
  final CameraController cameraController;

  const DocScanCameraInitialized(this.cameraController);

  @override
  List<Object> get props => [cameraController];
}

//camera disposed state, no additional data needed
final class DocScanCameraDisposed extends DocScanState {
  const DocScanCameraDisposed();

  @override
  List<Object> get props => [];
}

final class DocScanComplete extends DocScanState{}