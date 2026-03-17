import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_calc_state.freezed.dart';

@freezed
abstract class TimeCalcState with _$TimeCalcState {
  const factory TimeCalcState({
    required int totalBreakSeconds,
    required int totalBreakCount,
  }) = _TimeCalcState;

  factory TimeCalcState.initial() =>
      const _TimeCalcState(totalBreakCount: 0, totalBreakSeconds: 0);
}
