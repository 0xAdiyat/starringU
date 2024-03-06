// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_capture.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pictureCaptureRepositoryHash() =>
    r'0d844dc4d80f065c72e80f7bdf02238d41147bc2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PictureCaptureRepository
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final CameraController controller;

  FutureOr<void> build(
    CameraController controller,
  );
}

/// See also [PictureCaptureRepository].
@ProviderFor(PictureCaptureRepository)
const pictureCaptureRepositoryProvider = PictureCaptureRepositoryFamily();

/// See also [PictureCaptureRepository].
class PictureCaptureRepositoryFamily extends Family<AsyncValue<void>> {
  /// See also [PictureCaptureRepository].
  const PictureCaptureRepositoryFamily();

  /// See also [PictureCaptureRepository].
  PictureCaptureRepositoryProvider call(
    CameraController controller,
  ) {
    return PictureCaptureRepositoryProvider(
      controller,
    );
  }

  @override
  PictureCaptureRepositoryProvider getProviderOverride(
    covariant PictureCaptureRepositoryProvider provider,
  ) {
    return call(
      provider.controller,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pictureCaptureRepositoryProvider';
}

/// See also [PictureCaptureRepository].
class PictureCaptureRepositoryProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PictureCaptureRepository,
        void> {
  /// See also [PictureCaptureRepository].
  PictureCaptureRepositoryProvider(
    CameraController controller,
  ) : this._internal(
          () => PictureCaptureRepository()..controller = controller,
          from: pictureCaptureRepositoryProvider,
          name: r'pictureCaptureRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pictureCaptureRepositoryHash,
          dependencies: PictureCaptureRepositoryFamily._dependencies,
          allTransitiveDependencies:
              PictureCaptureRepositoryFamily._allTransitiveDependencies,
          controller: controller,
        );

  PictureCaptureRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.controller,
  }) : super.internal();

  final CameraController controller;

  @override
  FutureOr<void> runNotifierBuild(
    covariant PictureCaptureRepository notifier,
  ) {
    return notifier.build(
      controller,
    );
  }

  @override
  Override overrideWith(PictureCaptureRepository Function() create) {
    return ProviderOverride(
      origin: this,
      override: PictureCaptureRepositoryProvider._internal(
        () => create()..controller = controller,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        controller: controller,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PictureCaptureRepository, void>
      createElement() {
    return _PictureCaptureRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PictureCaptureRepositoryProvider &&
        other.controller == controller;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PictureCaptureRepositoryRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `controller` of this provider.
  CameraController get controller;
}

class _PictureCaptureRepositoryProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PictureCaptureRepository,
        void> with PictureCaptureRepositoryRef {
  _PictureCaptureRepositoryProviderElement(super.provider);

  @override
  CameraController get controller =>
      (origin as PictureCaptureRepositoryProvider).controller;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
