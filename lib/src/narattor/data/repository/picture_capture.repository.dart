import 'dart:async';

import 'package:camera/camera.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starring_u/clients/talker.dart';
import 'package:starring_u/core/utils/constants/k.constants.dart';

part 'picture_capture.repository.g.dart';

@riverpod
PictureCaptureRepository pictureCaptureRepository(
    PictureCaptureRepositoryRef ref, CameraController controller) {
  return PictureCaptureRepository(controller: controller, ref: ref);
}

class PictureCaptureRepository {
  late Timer pictureTimer;
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

    if (_controller.value.isInitialized) {
      _capturePicturePeriodically();
    }
    _dispose();
  }

  Future<void> _initializeCamera() async {
    try {
      await _controller.initialize();
    } catch (e) {
      talker.error('Error initializing camera: $e');
    }
  }

  Future<void> _capturePicturePeriodically() async {
    pictureTimer =
        Timer.periodic(KConstants.kPictureClickTimerDuration, (_) async {
      await _capturePicture();
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

  void _dispose() {
    _ref.onDispose(() {
      talker.debug("Disposed");
      pictureTimer.cancel();
      _controller.dispose();
    });
  }
}
