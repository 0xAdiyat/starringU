import 'dart:async';
import 'dart:ffi';

import 'package:camera/camera.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starring_u/clients/talker.dart';

part 'picture_capture.provider.g.dart';

const kPictureClickTimerDuration = Duration(seconds: 5);

@riverpod
class PictureCaptureRepositoryProvider
    extends _$PictureCaptureRepositoryProvider {
  late final Timer pictureTimer;

  @override
  FutureOr<void> build({required CameraController controller}) async {
    await _initializeCamera();

    if (controller.value.isInitialized) {
      talker.debug("I'm being called");
      await _capturePicturePeriodically();
    }

    _dispose();
  }

  Future<void> _initializeCamera() async {
    try {
      await controller.initialize();
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
      if (!controller.value.isTakingPicture) {
        final image = await controller.takePicture();
        talker.debug('Clicked pictures: ${image.toString()}');
      }
    } catch (e) {
      talker.error('Error taking picture: $e');
    }
  }

  void _dispose() {
    ref.onDispose(() {
      pictureTimer.cancel();
      controller.dispose();
    });
  }
}
