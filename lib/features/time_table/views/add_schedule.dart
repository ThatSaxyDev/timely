// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timely/features/time_table/controllers/time_table_controller.dart';
import 'package:timely/features/utils/convert_time.dart';
import 'package:timely/features/utils/nav.dart';
import 'package:timely/features/utils/utils.dart';
import 'package:timely/features/utils/widget_extensions.dart';
import 'package:timely/models/schedule_model.dart';
import 'package:timely/theme/palette.dart';

class AddScheduleView extends ConsumerStatefulWidget {
  const AddScheduleView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddScheduleViewState();
}

class _AddScheduleViewState extends ConsumerState<AddScheduleView> {
  final ValueNotifier<bool> daySelectionIsOpen = ValueNotifier(false);
  final ValueNotifier<bool> timeSelectionIsOpen = ValueNotifier(false);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();
  int _selectedDayIndex = 0;
  TimeOfDay _beginTime = const TimeOfDay(hour: 0, minute: 00);
  TimeOfDay _endTime = const TimeOfDay(hour: 0, minute: 00);
  final List<DatesAndTimes> periods = [];

  @override
  void initState() {
    super.initState();
    _beginTime = TimeOfDay.now();
    _endTime = TimeOfDay.fromDateTime(
      DateTime.now().add(
        const Duration(hours: 2),
      ),
    );
    _selectInitialBeginTime();
    _selectInitialEndTime();
  }

  Future<TimeOfDay> _selectInitialBeginTime() async {
    final TimeOfDay picked = TimeOfDay.now();

    setState(() {
      _beginTime = picked;
    });

    return picked;
  }

  Future<TimeOfDay> _selectInitialEndTime() async {
    final TimeOfDay picked = TimeOfDay.fromDateTime(
      DateTime.now().add(
        const Duration(hours: 2),
      ),
    );

    setState(() {
      _endTime = picked;
    });

    return picked;
  }

  Future<TimeOfDay?> _selectBeginTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _beginTime,
    );

    if (picked != null) {
      setState(() => _beginTime = picked);
    }

    return picked;
  }

  Future<TimeOfDay?> _selectEndTime() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _endTime);

    if (picked != null) {
      setState(() {
        _endTime = picked;
      });
      return picked;
    } else {
      return null;
    }
  }

  void createNewSchedule(
      {required WidgetRef ref, required ScheduleModel schedule}) {
    ref
        .read(timeTableControllerProvider.notifier)
        .createNewSchedule(schedule: schedule);
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeNotifierProvider);

    return GestureDetector(
      onTap: () {
        daySelectionIsOpen.value = false;
      },
      child: Scaffold(
        //! app bar
        appBar: AppBar(
          actions: [
            //! save button
            TextButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty) {
                  TimeOfDay begintimeOfDay = _beginTime;
                  TimeOfDay endtimeOfDay = _endTime;
                  DateTime now = DateTime.now();
                  DateTime begindateTime = DateTime(now.year, now.month,
                      now.day, begintimeOfDay.hour, begintimeOfDay.minute);
                  DateTime enddateTime = DateTime(now.year, now.month, now.day,
                      endtimeOfDay.hour, endtimeOfDay.minute);
                  final period = DatesAndTimes()
                    ..day = days[_selectedDayIndex]
                    ..beginAt = begindateTime
                    ..endAt = enddateTime;
                  periods.add(period);
                  final schedule = ScheduleModel()
                    ..title = _titleController.text
                    ..info = _infoController.text
                    ..datesAndTimes = periods;

                  createNewSchedule(ref: ref, schedule: schedule);

                  goBack(context);
                } else {
                  showSnackBar(context, 'Add a title');
                }
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: currentTheme.textTheme.bodyMedium!.color,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ],
        ),

        //! body
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: 20.padH,
                child: Column(
                  children: [
                    100.sbH,

                    //! selecting the day
                    ValueListenableBuilder(
                      valueListenable: daySelectionIsOpen,
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Day',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                //! button showing day
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    daySelectionIsOpen.value =
                                        !daySelectionIsOpen.value;
                                    timeSelectionIsOpen.value = false;
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 10.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: daySelectionIsOpen.value == true
                                          ? currentTheme
                                              .textTheme.bodyMedium!.color
                                          : currentTheme.backgroundColor,
                                      border: daySelectionIsOpen.value == true
                                          ? null
                                          : Border.all(width: 0.5.w),
                                    ),
                                    child: Text(
                                      days[_selectedDayIndex],
                                      style: TextStyle(
                                        color: daySelectionIsOpen.value == true
                                            ? currentTheme.backgroundColor
                                            : currentTheme
                                                .textTheme.bodyMedium!.color,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            15.sbH,

                            //! date selection animated container
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn,
                              height:
                                  daySelectionIsOpen.value == true ? 150.h : 0,
                              decoration: BoxDecoration(
                                color: currentTheme.drawerTheme.backgroundColor,
                                border: Border.all(
                                  color:
                                      currentTheme.textTheme.bodyMedium!.color!,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: currentTheme
                                          .textTheme.bodyMedium!.color!,
                                      offset: const Offset(5, 5)),
                                ],
                              ),
                              child: CupertinoPicker(
                                selectionOverlay: Container(
                                  color: currentTheme
                                      .textTheme.bodyMedium!.color!
                                      .withOpacity(0.1),
                                ),
                                scrollController: FixedExtentScrollController(
                                  initialItem: _selectedDayIndex,
                                ),
                                magnification: 1.2,
                                squeeze: 1.2,
                                useMagnifier: false,
                                itemExtent: 30.h,
                                onSelectedItemChanged: (int selectedItem) {
                                  setState(() {
                                    _selectedDayIndex = selectedItem;
                                  });
                                },
                                children: List<Widget>.generate(days.length,
                                    (int index) {
                                  return Center(
                                    child: Text(
                                      days[index],
                                      style: const TextStyle(),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    15.sbH,
                    //! selecting time
                    Row(
                      children: [
                        Text(
                          'Time',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),

                        //! buttons showing time
                        //! begins
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            daySelectionIsOpen.value = false;
                            _selectBeginTime();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: currentTheme.backgroundColor,
                              border: Border.all(width: 0.5.w),
                            ),
                            child: Text(
                              '${convertTime(_beginTime.hour.toString())}:${convertTime(_beginTime.minute.toString())}',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        5.sbW,
                        const Icon(Icons.arrow_forward_ios_rounded),
                        5.sbW,

                        //! ends
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            daySelectionIsOpen.value = false;
                            _selectEndTime();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: currentTheme.backgroundColor,
                              border: Border.all(width: 0.5.w),
                            ),
                            child: Text(
                              '${convertTime(_endTime.hour.toString())}:${convertTime(_endTime.minute.toString())}',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    30.sbH,

                    //! info text area
                    TextField(
                      onTap: () {
                        daySelectionIsOpen.value = false;
                      },
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                      cursorColor: currentTheme.textTheme.bodyMedium!.color!,
                      controller: _infoController,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: 'Info',
                        hintStyle: TextStyle(
                          fontSize: 20.sp,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    30.sbH,
                  ],
                ),
              ),
            ),

            //! title input
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  10.sbH,
                  Opacity(
                    opacity: 0.85,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 60.h,
                      padding: 15.padH,
                      decoration: BoxDecoration(
                        color: currentTheme.drawerTheme.backgroundColor,
                        border: Border.all(
                          color: currentTheme.textTheme.bodyMedium!.color!,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: currentTheme.textTheme.bodyMedium!.color!,
                              offset: const Offset(5, 5)),
                        ],
                      ),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        cursorColor: currentTheme.textTheme.bodyMedium!.color!,
                        controller: _titleController,
                        decoration: InputDecoration(
                          // contentPadding: 20.padH,
                          hintText: 'Title',
                          hintStyle: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
];
