import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:camera/camera.dart';
import 'package:starring_u/clients/talker.dart';
import 'package:starring_u/src/shared/presentation/pages/error_page.dart';
import 'package:starring_u/src/shared/presentation/widgets/standard_error_widget.dart';
import 'package:starring_u/src/shared/presentation/widgets/standard_loading_widget.dart';

class NarratorPage extends HookConsumerWidget {
  const NarratorPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = useMemoized(() => availableCameras());

    final camerasAsyncSnapshot = useFuture(result);

    switch (camerasAsyncSnapshot.connectionState) {
      case ConnectionState.none:
        talker.error('Error: ${camerasAsyncSnapshot.error}');
        return StandardErrorWidget(
            camerasAsyncSnapshot.error, camerasAsyncSnapshot.stackTrace!);
      case ConnectionState.waiting:
        return const StandardLoadingWidget();
      case ConnectionState.active:
        return const StandardLoadingWidget();
      case ConnectionState.done:
        final cameras = camerasAsyncSnapshot.data;
        if (cameras == null || cameras.isEmpty) {
          return const ErrorPage(
            errorMessage: "No camera found",
          );
        }
        final firstCamera = cameras.first;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Narrator'),
          ),
          body: TakePictureScreen(firstCamera),
        );
    }
  }
}

class TakePictureScreen extends HookConsumerWidget {
  final CameraDescription camera;

  const TakePictureScreen(this.camera, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late CameraController controller;
    late Future<void> initializeControllerFuture;

    useEffect(() {
      controller = useCameraController(
          description: camera, resolutionPreset: ResolutionPreset.medium);

      initializeControllerFuture = controller.initialize();
      return;
    }, []);

    return Scaffold(
      body: FutureBuilder<void>(
        future: initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(controller);
          } else {
            return const Center(child: StandardLoadingWidget());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await initializeControllerFuture;
            final image = await controller.takePicture();
          } catch (e) {
            talker.error('Error taking picture: $e');
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

CameraController useCameraController(
    {required CameraDescription description,
    required ResolutionPreset resolutionPreset,
    bool enableAudio = true,
    ImageFormatGroup? imageFormatGroup}) {
  final controller = useMemoized(
      () => CameraController(description, resolutionPreset,
          enableAudio: enableAudio, imageFormatGroup: imageFormatGroup),
      const []);

  /// since an empty dependency list ensures that the CameraController is created only once and remains the same instance for subsequent calls to useCameraController.

  useEffect(() => controller.dispose, [controller]);

  return controller;
}
