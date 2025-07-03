import 'package:flutter/material.dart';
import 'package:redact_safe/features/auth/presentation/widgets/login_form.dart';
import 'package:redact_safe/features/auth/presentation/widgets/privacy_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
                child: Image.asset(
                  "assets/icon/icon.png",
                  height: 80,
                  width: 80,
                  errorBuilder: (context, error, stack) {
                    return const Icon(Icons.error, color: Colors.red);
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome Back",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                "Sign in to your RedactSafe account",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              PrivacyCard(),
              LoginForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    " Register",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
