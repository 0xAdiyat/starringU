import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starring_u/clients/talker.dart';

part 'picture_capture.repository.g.dart';

const kPictureClickTimerDuration = Duration(seconds: 5);

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
      talker.debug("I'm being called");
      await _capturePicturePeriodically();
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
    pictureTimer = Timer.periodic(kPictureClickTimerDuration, (_) async {
      await _capturePicture();
    });
  }

  Future<void> _capturePicture() async {
    try {
      if (!_controller.value.isTakingPicture) {
        final image = await _controller.takePicture();
        talker.debug('Clicked pictures: ${image.toString()}');
      }
    } catch (e) {
      talker.error('Error taking picture: $e');
    }
  }

  void _dispose() {
    _ref.onDispose(() {
      pictureTimer.cancel();
      _controller.dispose();
    });
  }
}
