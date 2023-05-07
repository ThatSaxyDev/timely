import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timely/features/time_table/repositories/time_table_repository.dart';
import 'package:timely/models/schedule_model.dart';

//! get all schedules provider
final getAllSchedulesProvider = StreamProvider((ref) {
  final timeTableController = ref.watch(timeTableControllerProvider.notifier);
  return timeTableController.getAllSchedules();
});

//! time table controller provider
final timeTableControllerProvider =
    StateNotifierProvider<TimeTableController, bool>((ref) {
  final timeTableRepository = ref.watch(timeTableRepositoryProvider);
  return TimeTableController(
    timeTableRepository: timeTableRepository,
    ref: ref,
  );
});

class TimeTableController extends StateNotifier<bool> {
  final TimeTableRepository _timeTableRepository;
  final Ref _ref;
  TimeTableController({
    required TimeTableRepository timeTableRepository,
    required Ref ref,
  })  : _timeTableRepository = timeTableRepository,
        _ref = ref,
        super(false);

  //! create new schedule
  void createNewSchedule({required ScheduleModel schedule}) async {
    state = true;
    final res =
        await _timeTableRepository.createNewSchedule(schedule: schedule);
    state = false;

    res.fold(
      (l) => log(l.message),
      (r) => log('created'),
    );
  }

  //! update schedule
  void updateSchedule(
      {required ScheduleModel schedule, required int id}) async {
    state = true;
    final res =
        await _timeTableRepository.updateSchedule(schedule: schedule, id: id);
    state = false;

    res.fold(
      (l) => log(l.message),
      (r) => log('updated'),
    );
  }

  //! delete schedule
  void deleteSchedule({required int id}) async {
    state = true;
    final res = await _timeTableRepository.deleteSchedule(id: id);
    state = false;

    res.fold(
      (l) => log(l.message),
      (r) => log('deleted'),
    );
  }

  //! clear the database
  void clearTheDatabase() async {
    state = true;
    final res = await _timeTableRepository.clearTheDatabase();
    state = false;

    res.fold(
      (l) => log(l.message),
      (r) => log('cleared'),
    );
  }

  //! get all schedules
  Stream<List<ScheduleModel>> getAllSchedules() {
    return _timeTableRepository.getAllSchedules();
  }
}
