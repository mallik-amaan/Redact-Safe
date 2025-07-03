import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redact_safe/features/doc_capture/presentation/providers/cubit/doc_scan_cubit.dart';
import 'package:redact_safe/features/doc_capture/presentation/widgets/capture_button.dart';

class DocScanScreen extends StatefulWidget {
  const DocScanScreen({super.key});

  @override
  State<DocScanScreen> createState() => _DocScanScreenState();
}

class _DocScanScreenState extends State<DocScanScreen> {
  @override
  void initState() {
    BlocProvider.of<DocScanCubit>(context).initializeCamera();
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<DocScanCubit>(context).disposeCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Document Scan')),
      body: BlocConsumer<DocScanCubit, DocScanState>(
        listener: (context, state) {
          if (state is DocScanLoading) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Loading camera...')));
          } else if (state is DocScanCameraInitialized) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            // You can add logic to display the camera preview here
          } else if (state is DocScanError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is DocScanCameraDisposed) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Camera disposed')));
          }
        },
        builder: (context, state) {
          if (state is DocScanCameraInitialized &&
              state.cameraController.value.isInitialized) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Point the camera at a document to scan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Flexible(
                  child: AspectRatio(
                    aspectRatio: 9 / 16,
                    child: CameraPreview(state.cameraController),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CaptureButton(
                    onCapture: () {
                      BlocProvider.of<DocScanCubit>(context).captureDocument();
                    },
                  ),
                ),
              ],
            );
          } else if (state is DocScanSuccess) {
            return Center(
              child: Column(
                children: [
                  Text(
                    'Document captured successfully',
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
                  SizedBox(height: 20),
                  Image.file(File(state.filePath), scale: 1),
                ],
              ),
            );
          } else if (state is DocScanLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DocScanError) {
            return Center(child: Text("Error: ${state.message}"));
          } else {
            return const Center(child: Text("Initializing camera..."));
          }
        },
      ),
    );
  }
}
