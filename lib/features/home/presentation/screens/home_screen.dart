import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redact_safe/features/home/presentation/widgets/home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 8.0,
          ), // optional, adds spacing
          child: SizedBox(
            width: 32,
            height: 32,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // makes it circular
              child: Image.asset(
                "assets/icon/icon.png",
                fit: BoxFit.contain,
                errorBuilder: (context, error, stack) {
                  return const Icon(Icons.error, color: Colors.red);
                },
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person),
            ),
          ),
        ],
        title: Text(
          "RedactSafe",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Secure your Documents",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Automatically detect and redact sensitive information from your documents with AI-powered protection.",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            SizedBox(height: 20),

            HomeScreenCard(
              icon: Icons.document_scanner,
              iconColor: Theme.of(context).primaryColor,
              title: "Scan Document",
              subtitle: "Use camera to scan documents",
              onTap: () {
                context.go('/doc-scan');
                // Handle tap action
              },
            ),
            SizedBox(height: 20),
            HomeScreenCard(
              icon: Icons.upload_file_rounded,
              iconColor: Theme.of(context).shadowColor.withValues(alpha: 0.7),
              title: "Upload from device",
              subtitle: "Select files from your device",
              onTap: () {
                // Handle tap action
              },
            ),
          ],
        ),
      ),
    );
  }
}
