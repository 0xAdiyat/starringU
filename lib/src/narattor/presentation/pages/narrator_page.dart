import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:camera/camera.dart';
import 'package:starring_u/clients/talker.dart';
import 'package:starring_u/core/utils/constants/resources/app_styles.manager.constants.dart';
import 'package:starring_u/core/utils/extensions/non_null.ext.dart';
import 'package:starring_u/router/config.routes.dart';
import 'package:starring_u/src/narattor/data/repository/picture_capture.repository.dart';
import 'package:starring_u/src/shared/presentation/widgets/standard_error_widget.dart';
import 'package:starring_u/src/shared/presentation/widgets/standard_loading_widget.dart';

import '../../../shared/presentation/hooks/hooks_controllers.dart';

class NarratorPage extends HookConsumerWidget {
  const NarratorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = useMemoized(() => availableCameras());

    final camerasAsyncSnapshot = useFuture(result);

    switch (camerasAsyncSnapshot.connectionState) {
      case ConnectionState.none:
        return _buildErrorWidget('Error: ${camerasAsyncSnapshot.error}', ref);
      case ConnectionState.waiting:
        return const StandardLoadingWidget();
      case ConnectionState.active:
        return const StandardLoadingWidget();
      case ConnectionState.done:
        final cameras = camerasAsyncSnapshot.data;

        if (cameras.orEmpty()) {
          return _buildErrorWidget("No camera found", ref);
        }

        _captureAndProcess(cameras!.first, ref);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Narrator'),
          ),
          body: Column(
            children: [
              Text(
                "starringU",
                style: getDisplayLarge(context),
              ),
            ],
          ),
          floatingActionButton: TextButton(
              onPressed: () => const ErrorRoute().push(context),
              child: const Text("Go to error screen")),
        );
    }
  }

  /// Widgets
  Widget _buildErrorWidget(String errorMessage, WidgetRef ref) {
    talker.error(errorMessage);
    return StandardErrorWidget(errorMessage, StackTrace.current);
  }

  /// Functions
  void _captureAndProcess(CameraDescription camera, WidgetRef ref) {
    useEffect(() {
      final cameraController = useCameraController(
          description: camera, resolutionPreset: ResolutionPreset.medium);

      ref.read(pictureCaptureRepositoryProvider(cameraController));
      return () {
        talker.debug("DISPOSED in narrator page");
      };
    }, const []);
  }
}
