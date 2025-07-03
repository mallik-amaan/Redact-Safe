import 'package:go_router/go_router.dart';
import 'package:redact_safe/features/auth/presentation/screens/login.dart';
import 'package:redact_safe/features/doc_capture/presentation/screens/doc_scan_screen.dart';
import 'package:redact_safe/features/home/presentation/widgets/bottom_navigation.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/',
        builder: (context, state) {
          return BottomNavigation();
        },
      ),
      GoRoute(
        path: '/doc-scan',
        builder: (context, state) {
          return const DocScanScreen();
        },
      )
    ],
  );
}
