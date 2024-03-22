import 'package:camera/camera.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Creates a [CameraController] with the given [description], [resolutionPreset], [enableAudio], and [imageFormatGroup].
///
/// The [description] parameter specifies the camera to be controlled.
/// The [resolutionPreset] parameter specifies the resolution preset for the camera.
/// The [enableAudio] parameter specifies whether audio should be enabled for the camera. Defaults to `true`.
/// The [imageFormatGroup] parameter specifies the image format group for the camera. Defaults to `null`.
///
/// Returns a [CameraController] instance that can be used to control the camera.
CameraController useCameraController({
  required CameraDescription description,
  required ResolutionPreset resolutionPreset,
  bool enableAudio = true,
  ImageFormatGroup? imageFormatGroup,
}) {
  final controller = useMemoized(
    () => CameraController(
      description,
      resolutionPreset,
      enableAudio: enableAudio,
      imageFormatGroup: imageFormatGroup,
    ),
    const [],
  );

  /// since an empty dependency list ensures that the CameraController is created only once and remains the same instance for subsequent calls to useCameraController.
  useEffect(() => controller.dispose, [controller]);

  return controller;
}
