// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_calc_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TimeCalcViewModel)
const timeCalcViewModelProvider = TimeCalcViewModelProvider._();

final class TimeCalcViewModelProvider
    extends $NotifierProvider<TimeCalcViewModel, TimeCalcState> {
  const TimeCalcViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timeCalcViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timeCalcViewModelHash();

  @$internal
  @override
  TimeCalcViewModel create() => TimeCalcViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TimeCalcState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TimeCalcState>(value),
    );
  }
}

String _$timeCalcViewModelHash() => r'1df0b22686ed6a3732018de1edf552d77f1a30da';

abstract class _$TimeCalcViewModel extends $Notifier<TimeCalcState> {
  TimeCalcState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TimeCalcState, TimeCalcState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TimeCalcState, TimeCalcState>,
              TimeCalcState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
