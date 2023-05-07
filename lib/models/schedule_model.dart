import 'package:isar/isar.dart';

part 'schedule_model.g.dart';

@collection
class ScheduleModel {
  Id id = Isar.autoIncrement;
  late String title;
  late List<DatesAndTimes> datesAndTimes;
  late String info;
}

@embedded
class DatesAndTimes {
  late String day;
  late DateTime beginAt;
  late DateTime endAt;
}
