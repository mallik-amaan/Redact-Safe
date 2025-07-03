import 'package:get_it/get_it.dart';
import 'package:redact_safe/core/services/camera_service.dart';
import 'package:redact_safe/features/auth/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:redact_safe/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:redact_safe/features/auth/domain/use_cases/auth_use_case_bundle.dart';
import 'package:redact_safe/features/auth/domain/use_cases/sign_in_using_email_password.dart';
import 'package:redact_safe/features/auth/domain/use_cases/sign_up_using_email_password.dart';
import 'package:redact_safe/features/auth/presentation/providers/cubit/auth_bloc_cubit.dart';
import 'package:redact_safe/features/doc_capture/data/repositories/doc_capture_repository_impl.dart';
import 'package:redact_safe/features/doc_capture/domain/use_cases/dispose_camera.dart';
import 'package:redact_safe/features/doc_capture/domain/use_cases/doc_capture.dart';
import 'package:redact_safe/features/doc_capture/domain/use_cases/doc_scan_usecase_bundle.dart';
import 'package:redact_safe/features/doc_capture/domain/use_cases/initialize_camera.dart';
import 'package:redact_safe/features/doc_capture/presentation/providers/cubit/doc_scan_cubit.dart';

GetIt sl = GetIt.instance;

void injectDependencies() {
  //services initialization
  sl.registerFactory(() => CameraService());

  //Auth initialization
  registerAuthDependencies();
  //Doc Capture initialization
  registerDocCaptureDependencies();
}

void registerAuthDependencies() {
  sl.registerLazySingleton(() => AuthRemoteDataSourceImpl());
  sl.registerLazySingleton(
    () => AuthRepositoryImpl(
      authRemoteDataSource: sl<AuthRemoteDataSourceImpl>(),
    ),
  );
  sl.registerLazySingleton(
    () => AuthUseCaseBundle(
      signInUsingEmailPassword: SignInUsingEmailPassword(
        sl<AuthRepositoryImpl>(),
      ),
      signUpUsingEmailPassword: SignUpUsingEmailPassword(
        sl<AuthRepositoryImpl>(),
      ),
    ),
  );
  sl.registerFactory(
    () => AuthBlocCubit(authUseCaseBundle: sl<AuthUseCaseBundle>()),
  );
}

void registerDocCaptureDependencies() {
  sl.registerLazySingleton(
    () => DocCaptureRepositoryImpl(cameraService: sl<CameraService>()),
  );
  sl.registerLazySingleton(
    () => DocScanUsecaseBundle(
      docCapture: DocCapture(sl<DocCaptureRepositoryImpl>()),
      initializeCamera: InitializeCamera(sl<DocCaptureRepositoryImpl>()),
      disposeCamera: DisposeCamera(
        docCaptureRepository: sl<DocCaptureRepositoryImpl>(),
    ),
  ));
  sl.registerFactory(
    () => DocScanCubit(docScanUsecaseBundle: sl<DocScanUsecaseBundle>()),
  );
}
