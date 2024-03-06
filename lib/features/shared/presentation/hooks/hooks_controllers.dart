import 'package:camera/camera.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


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
