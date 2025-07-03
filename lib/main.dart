import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redact_safe/app_router.dart';
import 'package:redact_safe/core/consts/app_theme.dart';
import 'package:redact_safe/features/auth/presentation/providers/cubit/auth_bloc_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:redact_safe/features/doc_capture/presentation/providers/cubit/doc_scan_cubit.dart';
import 'package:redact_safe/service_locator.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<AuthBlocCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<DocScanCubit>()
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter().router,
        title: 'Redact Safe',
        theme: AppTheme().lightTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
