import 'dart:async';

import 'package:camera/camera.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starring_u/clients/talker.dart';
import 'package:starring_u/core/utils/constants/k.constants.dart';
import 'package:starring_u/logs/custom_talker_router_observer.dart';

part 'picture_capture.repository.g.dart';

@riverpod
PictureCaptureRepository pictureCaptureRepository(
    PictureCaptureRepositoryRef ref, CameraController cameraController) {
  return PictureCaptureRepository(controller: cameraController, ref: ref);
}

class PictureCaptureRepository {
  final CameraController _controller;
  final Ref _ref;
  PictureCaptureRepository(
      {required CameraController controller, required Ref ref})
      : _controller = controller,
        _ref = ref {
    _initialize();
  }

  Future<void> _initialize() async {
    await _initializeCamera();

    _capturePicturePeriodically();
  }

  Future<void> _initializeCamera() async {
    try {
      await _controller.initialize();
    } catch (e) {
      talker.error('Error initializing camera: $e');
    }
  }

  Future<void> _capturePicturePeriodically() async {
    Timer.periodic(KConstants.kPictureClickTimerDuration, (Timer t) {
      if (_ref.watch(routeStateProvider) != "/") {
        t.cancel();
        dispose();
        return;
      } else if (_controller.value.isInitialized) {
        _capturePicture();
      }
      return;
    });
  }

  Future<void> _capturePicture() async {
    try {
      if (!_controller.value.isTakingPicture) {
        final image = await _controller.takePicture();
        talker.debug('Clicked pictures: ${image.path}');
      }
    } catch (e) {
      talker.error('Error taking picture: $e');
    }
  }

  void dispose() {
    if (_controller.value.isInitialized) {
      _controller.dispose();
    }
  }
}
