// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_capture.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pictureCaptureRepositoryProviderHash() =>
    r'a8376a1ea858e89963b31aceffba800a191f0636';

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

abstract class _$PictureCaptureRepositoryProvider
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final CameraController controller;

  FutureOr<void> build({
    required CameraController controller,
  });
}

/// See also [PictureCaptureRepositoryProvider].
@ProviderFor(PictureCaptureRepositoryProvider)
const pictureCaptureRepositoryProviderProvider =
    PictureCaptureRepositoryProviderFamily();

/// See also [PictureCaptureRepositoryProvider].
class PictureCaptureRepositoryProviderFamily extends Family<AsyncValue<void>> {
  /// See also [PictureCaptureRepositoryProvider].
  const PictureCaptureRepositoryProviderFamily();

  /// See also [PictureCaptureRepositoryProvider].
  PictureCaptureRepositoryProviderProvider call({
    required CameraController controller,
  }) {
    return PictureCaptureRepositoryProviderProvider(
      controller: controller,
    );
  }

  @override
  PictureCaptureRepositoryProviderProvider getProviderOverride(
    covariant PictureCaptureRepositoryProviderProvider provider,
  ) {
    return call(
      controller: provider.controller,
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
  String? get name => r'pictureCaptureRepositoryProviderProvider';
}

/// See also [PictureCaptureRepositoryProvider].
class PictureCaptureRepositoryProviderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        PictureCaptureRepositoryProvider, void> {
  /// See also [PictureCaptureRepositoryProvider].
  PictureCaptureRepositoryProviderProvider({
    required CameraController controller,
  }) : this._internal(
          () => PictureCaptureRepositoryProvider()..controller = controller,
          from: pictureCaptureRepositoryProviderProvider,
          name: r'pictureCaptureRepositoryProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pictureCaptureRepositoryProviderHash,
          dependencies: PictureCaptureRepositoryProviderFamily._dependencies,
          allTransitiveDependencies:
              PictureCaptureRepositoryProviderFamily._allTransitiveDependencies,
          controller: controller,
        );

  PictureCaptureRepositoryProviderProvider._internal(
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
    covariant PictureCaptureRepositoryProvider notifier,
  ) {
    return notifier.build(
      controller: controller,
    );
  }

  @override
  Override overrideWith(PictureCaptureRepositoryProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: PictureCaptureRepositoryProviderProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PictureCaptureRepositoryProvider,
      void> createElement() {
    return _PictureCaptureRepositoryProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PictureCaptureRepositoryProviderProvider &&
        other.controller == controller;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PictureCaptureRepositoryProviderRef
    on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `controller` of this provider.
  CameraController get controller;
}

class _PictureCaptureRepositoryProviderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        PictureCaptureRepositoryProvider,
        void> with PictureCaptureRepositoryProviderRef {
  _PictureCaptureRepositoryProviderProviderElement(super.provider);

  @override
  CameraController get controller =>
      (origin as PictureCaptureRepositoryProviderProvider).controller;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
