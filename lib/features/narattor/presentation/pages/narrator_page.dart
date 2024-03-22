import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:camera/camera.dart';
import 'package:starring_u/core/utils/constants/resources/app_styles.manager.constants.dart';
import 'package:starring_u/core/utils/extensions/non_null.ext.dart';
import 'package:starring_u/logs/custom_talker_router_observer.dart';
import 'package:starring_u/router/config.routes.dart';
import 'package:starring_u/features/narattor/data/repository/picture_capture.repository.dart';
import 'package:starring_u/core/shared/presentation/widgets/standard_error_widget.dart';
import 'package:starring_u/core/shared/presentation/widgets/standard_loading_widget.dart';

import '../../../../core/shared/presentation/hooks/hooks_controllers.dart';

class NarratorPage extends HookConsumerWidget {
  const NarratorPage({super.key});

  @override

  // Builds the UI based on the state of the camerasAsyncSnapshot.
  // It returns different widgets based on the ConnectionState and the data from camerasAsyncSnapshot.
  // If the currentRoute is the Narrator screen, it also sets up the camera controller and returns a Scaffold with a Column containing a Text widget.
  Widget build(BuildContext context, WidgetRef ref) {
    final result = useMemoized(() => availableCameras());

    final camerasAsyncSnapshot = useFuture(result);

    switch (camerasAsyncSnapshot.connectionState) {
      case ConnectionState.none:
        return StandardErrorWidget(
            'Error: ${camerasAsyncSnapshot.error}', StackTrace.current);
      case ConnectionState.waiting:
        return const StandardLoadingWidget();
      case ConnectionState.active:
        return const StandardLoadingWidget();
      case ConnectionState.done:
        final cameras = camerasAsyncSnapshot.data;
        if (cameras.orEmpty()) {
          return StandardErrorWidget('No camera found.', StackTrace.current);
        }

        /// This section will only run if the `currentRoute` is [Narrator screen]
        if (ref.watch(currentRouteProvider) == "/") {
          // Set up the camera controller
          final cameraController = useCameraController(
              description: cameras!.first,
              resolutionPreset: ResolutionPreset.medium);

          return ref
              .watch(pictureCaptureRepositoryProvider(cameraController))
              .when(
                  data: (data) => Scaffold(
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
                      ),
                  loading: () => const StandardLoadingWidget(),
                  error: (Object error, StackTrace stackTrace) =>
                      StandardErrorWidget(error, stackTrace));
        }
        // If the currentRoute is not the Narrator screen, it returns an empty container.
        return Container();
    }
  }
}
