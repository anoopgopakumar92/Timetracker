import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:staytics/features/dashboard/presentation/states/time_calc_state.dart';

part 'time_calc_view_model.g.dart';

@riverpod
class TimeCalcViewModel extends _$TimeCalcViewModel {
  @override
  TimeCalcState build() {
    return TimeCalcState.initial();
  }
}
