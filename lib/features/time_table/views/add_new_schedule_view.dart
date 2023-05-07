import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timely/features/time_table/controllers/time_table_controller.dart';
import 'package:timely/features/time_table/views/time_table_view.dart';
import 'package:timely/features/utils/nav.dart';
import 'package:timely/features/utils/snack_bar.dart';
import 'package:timely/features/utils/widget_extensions.dart';
import 'package:timely/models/schedule_model.dart';

class AddNewScheduleView extends ConsumerStatefulWidget {
  const AddNewScheduleView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewScheduleViewState();
}

class _AddNewScheduleViewState extends ConsumerState<AddNewScheduleView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController infoController = TextEditingController();
  final List<DatesAndTimes> periods = [];

  void createNewSchedule(
      {required WidgetRef ref, required ScheduleModel schedule}) {
    ref
        .read(timeTableControllerProvider.notifier)
        .createNewSchedule(schedule: schedule);
  }

  void clearTheDatabase({required WidgetRef ref}) {
    ref.read(timeTableControllerProvider.notifier).clearTheDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToViews(context, TimeTableView()),
      ),
      body: Center(
        child: Padding(
          padding: 30.padH,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(hintText: 'title'),
              ),
              TextField(
                controller: infoController,
                decoration: const InputDecoration(hintText: 'info'),
              ),
              100.sbH,
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty) {
                    TimeOfDay begintimeOfDay = TimeOfDay(hour: 7, minute: 10);
                    TimeOfDay endtimeOfDay = TimeOfDay(hour: 9, minute: 10);
                    DateTime now = DateTime.now();
                    DateTime begindateTime = DateTime(now.year, now.month,
                        now.day, begintimeOfDay.hour, begintimeOfDay.minute);
                    DateTime enddateTime = DateTime(now.year, now.month,
                        now.day, endtimeOfDay.hour, endtimeOfDay.minute);
                    final period = DatesAndTimes()
                      ..day = 'Monday'
                      ..beginAt = begindateTime
                      ..endAt = enddateTime;
                    periods.add(period);
                    final schedule = ScheduleModel()
                      ..title = titleController.text
                      ..info = infoController.text
                      ..datesAndTimes = periods;

                    createNewSchedule(ref: ref, schedule: schedule);
                  } else {
                    showSnackBar(context, 'Add a title');
                  }
                },
                child: const Text('add'),
              ),
              50.sbH,

              //! CLEAR DB
              ElevatedButton(
                onPressed: () => clearTheDatabase(ref: ref),
                child: const Text('clear db'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
