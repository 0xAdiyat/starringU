import 'dart:async';

import 'package:camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starring_u/clients/talker.dart';
import 'package:starring_u/core/utils/constants/k.constants.dart';

part 'picture_capture.repository.g.dart';

@riverpod
class PictureCaptureRepository extends _$PictureCaptureRepository {
  late Timer _timer;
  @override

  /// Builds the repository by setting up the [CameraController] and
  /// initializing it.
  ///
  /// The [CameraController] is set to dispose when this repository is
  /// disposed.
  ///
  /// Returns a [Future] that completes when the camera is initialized.
  Future<void> build(CameraController controller) async {
    // Register a callback that disposes the camera controller when this
    // repository is disposed.
    ref.onDispose(() {
      if (controller.value.isInitialized) {
        _timer.cancel();
        controller.dispose();
      }
    });

    // Initialize the camera controller
    return _initialize();
  }

  /// Initializes the [CameraController] and starts the periodic timer.
  ///
  /// The [CameraController] initialization is asynchronous, so this method
  /// returns a [Future] that completes when the camera is initialized.
  ///
  /// The periodic timer is started after the camera is initialized.
  Future<void> _initialize() async {
    // Initialize camera
    await controller.initialize();

    // Start periodic timer
    _capturePicturePeriodically();
  }

  /// Starts a timer that periodically captures a picture using the camera
  /// controller.
  ///
  /// The timer is set to [KConstants.kPictureClickTimerDuration]. If the
  /// camera controller is not initialized when the timer fires, the timer is
  /// simply restarted.
  ///
  /// The timer is started in [_initialize].
  ///
  /// When the timer fires, it calls [_capturePicture].
  Future<void> _capturePicturePeriodically() async =>
      _timer = Timer.periodic(KConstants.kPictureClickTimerDuration, (Timer t) {
        if (controller.value.isInitialized) {
          _capturePicture();
        }
        // Returning from the callback is not necessary, but it makes the code
        // easier to read and understand.
        return;
      });

  /// Captures a picture using the camera controller.
  ///
  /// If the camera controller is not initialized when this method is called,
  /// the method simply does nothing.
  ///
  /// The captured picture is logged to the console using [talker].
  ///
  /// Returns a [Future] that completes when the picture is taken and logged.
  /// The [Future] does not return any useful data.
  Future<void> _capturePicture() async {
    // Ignore if the camera controller is not initialized
    if (!controller.value.isInitialized) {
      return;
    }

    // Only take a picture if the camera is not taking a picture already
    if (!controller.value.isTakingPicture) {
      // Take picture and log path to console
      final image = await controller.takePicture();
      talker.log('Clicked pictures: ${image.path}');
    }
  }
}
