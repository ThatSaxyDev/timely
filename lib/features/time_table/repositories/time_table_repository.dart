import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timely/features/utils/failure.dart';
import 'package:timely/features/utils/type_defs.dart';
import 'package:timely/models/schedule_model.dart';

final timeTableRepositoryProvider = Provider((ref) {
  return TimeTableRepository();
});

class TimeTableRepository {
  late Future<Isar> db;
  TimeTableRepository() {
    isarService();
  }
  isarService() {
    db = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final directory = (await getApplicationDocumentsDirectory()).path;
      return await Isar.open(
        directory: directory,
        [ScheduleModelSchema],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }

  //! create new schedule
  FutureVoid createNewSchedule({required ScheduleModel schedule}) async {
    try {
      final isar = await db;
      isar.writeTxn(
        () => isar.scheduleModels.put(schedule),
      );

      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! update schedule
  FutureVoid updateSchedule({
    required ScheduleModel schedule,
    required int id,
  }) async {
    try {
      final isar = await db;
      log(schedule.id.toString());
      ScheduleModel? existingSchedule =
          await isar.scheduleModels.where().idEqualTo(id).findFirst();
      if (existingSchedule != null) {
        existingSchedule.title = schedule.title;
        existingSchedule.datesAndTimes = schedule.datesAndTimes;
        existingSchedule.info = schedule.info;
        isar.writeTxn(() => isar.scheduleModels.put(existingSchedule));
        return right(null);
      } else {
        return left(Failure('Schedule not found'));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! delete a schedule
  FutureVoid deleteSchedule({
    required int id,
  }) async {
    try {
      final isar = await db;
      isar.writeTxn(() async {
        bool deleted = await isar.scheduleModels.delete(id);
        if (deleted) {
          return right(null);
        } else {
          return left(Failure('error'));
        }
      });

      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! get all schedules
  Stream<List<ScheduleModel>> getAllSchedules() async* {
    final isar = await db;
    final scheduleStream =
        isar.scheduleModels.where().watch(fireImmediately: true);
    yield* scheduleStream;
  }

  //! clear the database
  FutureVoid clearTheDatabase() async {
    try {
      final isar = await db;
      await isar.writeTxn(() => isar.clear());

      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
