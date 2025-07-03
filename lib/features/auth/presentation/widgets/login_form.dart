import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:redact_safe/features/auth/presentation/providers/cubit/auth_bloc_cubit.dart';
import 'package:redact_safe/features/auth/presentation/widgets/login_field.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey<FormState>(),
      autovalidateMode: AutovalidateMode.onUserInteraction,

      child: BlocConsumer<AuthBlocCubit, AuthBlocState>(
        listener: (context, state) {
          if (state is AuthBlocFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          } else if (state is AuthBlocSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Login successful!"),
                  backgroundColor: Colors.green,
                  duration: const Duration(milliseconds: 100),
                ),
              );
            context.go('/');
            // Navigate to the next screen or perform any other action
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email Address",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    LoginField(
                      controller: emailController,
                      label: "Enter your email",
                      icon: Icon(Icons.email, size: 24),
                    ),
                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    LoginField(
                      controller: passwordController,
                      label: "Enter your password",
                      icon: Icon(Icons.lock, size: 24),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot password?",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (state is! AuthBlocLoading) {
                            BlocProvider.of<AuthBlocCubit>(
                              context,
                            ).signInWithEmailAndPassword(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                          }
                        },
                        child: state is AuthBlocLoading
                            ? Center(
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                "Sign In",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
