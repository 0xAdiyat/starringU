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
  Future<void> build(CameraController controller) async {
    ref.onDispose(() {
      if (controller.value.isInitialized) {
        _timer.cancel();
        controller.dispose();
      }
    });

    return _initialize();
  }

  Future<void> _initialize() async {
    // Initialize camera
    await controller.initialize();

    // Start periodic timer
    _capturePicturePeriodically();
  }

  Future<void> _capturePicturePeriodically() async =>
      _timer = Timer.periodic(KConstants.kPictureClickTimerDuration, (Timer t) {
        if (controller.value.isInitialized) {
          _capturePicture();
        }
        return;
      });

  Future<void> _capturePicture() async {
    if (!controller.value.isTakingPicture) {
      final image = await controller.takePicture();
      talker.log('Clicked pictures: ${image.path}');
    }
  }
}
