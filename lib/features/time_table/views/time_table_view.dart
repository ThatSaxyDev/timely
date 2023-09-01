// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:timely/features/time_table/controllers/time_table_controller.dart';
import 'package:timely/features/time_table/views/add_schedule.dart';
import 'package:timely/features/time_table/widgets/time_table_tile.dart';
import 'package:timely/features/utils/error_text.dart';
import 'package:timely/features/utils/loader.dart';
import 'package:timely/features/utils/nav.dart';
import 'package:timely/features/utils/utils.dart';
import 'package:timely/features/utils/widget_extensions.dart';
import 'package:timely/models/schedule_model.dart';
import 'package:timely/theme/palette.dart';
import 'package:url_launcher/url_launcher.dart';

class TimeTableView extends ConsumerStatefulWidget {
  const TimeTableView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimeTableViewState();
}

class _TimeTableViewState extends ConsumerState<TimeTableView> {
  final ValueNotifier<int> tileTapped = ValueNotifier(-1);
  // final CarouselController _controller = CarouselController();

  void toggleTheme(WidgetRef ref) {
    ref.read(themeNotifierProvider.notifier).toggleTheme();
  }

  void clearTheDatabase({required WidgetRef ref}) {
    ref.read(timeTableControllerProvider.notifier).clearTheDatabase();
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeNotifierProvider);
    final schedulesStream = ref.watch(getAllSchedulesProvider);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => displayDrawer(context),
            icon: Icon(
              PhosphorIcons.regular.list,
              size: 30.sp,
            ),
          );
        }),
        actions: [
          IconButton(
            onPressed: () => navigateToViews(context, const AddScheduleView()),
            icon: Icon(
              PhosphorIcons.bold.plus,
              size: 30.sp,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        width: 250.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Light',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  10.sbW,
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () => toggleTheme(ref),
                    child: Container(
                      height: 20.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          color: currentTheme.textTheme.bodyMedium!.color,
                          border: Border.all(
                            color: currentTheme.textTheme.bodyMedium!.color!,
                          )),
                      child: Stack(
                        children: [
                          AnimatedAlign(
                            curve: Curves.easeInOut,
                            alignment: ref
                                        .watch(themeNotifierProvider.notifier)
                                        .mode ==
                                    ThemeMode.dark
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            duration: 250.ms,
                            child: Container(
                              height: 20.h,
                              width: 20.h,
                              color: currentTheme.backgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  10.sbW,
                  const Text(
                    'Dark',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              200.sbH,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: currentTheme.textTheme.bodyMedium!.color,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                    ),
                  ),
                ),
                onPressed: () => clearTheDatabase(ref: ref),
                child: Text(
                  'clear db',
                  style: TextStyle(
                    color: currentTheme.backgroundColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: schedulesStream.when(
        data: (schedules) {
          // log(schedules.length.toString());
          if (schedules.isEmpty) {
            return SizedBox(
              height: height(context),
              width: width(context),
              child: Center(
                child: Padding(
                  padding: 24.padH,
                  child: Column(
                    children: [
                      50.sbH,
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.h),
                        decoration: BoxDecoration(
                          color: currentTheme.drawerTheme.backgroundColor,
                          border: Border.all(
                            color: currentTheme.textTheme.bodyMedium!.color!,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    currentTheme.textTheme.bodyMedium!.color!,
                                offset: const Offset(5, 5)),
                          ],
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Welcome To Timely',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20.sp,
                                  color:
                                      currentTheme.textTheme.bodyMedium!.color,
                                ),
                              ),
                            ),
                            30.sbH,
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '[Tap the [+] icon later]',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color:
                                      currentTheme.textTheme.bodyMedium!.color,
                                ),
                              ),
                            ),
                            30.sbH,
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  _launchURL('https://x.com/thatsaxydev?s=21');
                                },
                                child: Text(
                                  'Twitter: @thatsaxydev',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: currentTheme
                                        .textTheme.bodyMedium!.color,
                                  ),
                                ),
                              ),
                            ),
                            10.sbH,
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  _launchURL(
                                      'https://github.com/ThatSaxyDev/timely');
                                },
                                child: Text(
                                  'Github: github.com/ThatSaxyDev',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: currentTheme
                                        .textTheme.bodyMedium!.color,
                                  ),
                                ),
                              ),
                            ),
                            10.sbH,
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  _launchURL(
                                      'https://drive.google.com/file/d/1iR1uKwI78K0A8zpGD3PxQ6A6Iew0zK85/view?usp=drivesdk');
                                },
                                child: Text(
                                  'Resume: Google Drive',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: currentTheme
                                        .textTheme.bodyMedium!.color,
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
              ),
            );
          }

          Map<String, List<ScheduleModel>> scheduleByDay = {};

          for (ScheduleModel schedule in schedules) {
            for (DatesAndTimes datesAndTimes in schedule.datesAndTimes) {
              String day = datesAndTimes.day;
              if (!scheduleByDay.containsKey(day)) {
                scheduleByDay[day] = [schedule];
              } else {
                scheduleByDay[day]!.add(schedule);
              }
            }
          }

          return CarouselSlider.builder(
            itemCount: days.length,
            itemBuilder: (context, index, realIndex) {
              List<ScheduleModel>? dayList = scheduleByDay[days[index]];

              if (dayList != null) {
                dayList.sort((a, b) => a.datesAndTimes
                    .map((e) => e.beginAt)
                    .reduce((value, element) =>
                        value.isBefore(element) ? value : element)
                    .compareTo(b.datesAndTimes.map((e) => e.beginAt).reduce(
                        (value, element) =>
                            value.isBefore(element) ? value : element)));
              }
              return TimeTablePage(
                day: days[index],
                dayList: dayList,
                currentTheme: currentTheme,
              );
            },
            options: CarouselOptions(
              aspectRatio: 9 / 16,
              viewportFraction: 1,
              scrollPhysics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
            ),
          );

          // return PageView.builder(
          //   itemCount: days.length,
          //   pageSnapping: true,
          //   physics: const AlwaysScrollableScrollPhysics(
          //     parent: BouncingScrollPhysics(),
          //   ),
          //   itemBuilder: (context, index) {
          //     List<ScheduleModel>? dayList = scheduleByDay[days[index]];
          //     return TimeTablePage(
          //       day: days[index],
          //       dayList: dayList,
          //       currentTheme: currentTheme,
          //     );
          //   },
          // );
        },
        error: (error, stactrace) => ErrorText(error: error.toString()),
        loading: () => const Loader(),
      ),
    );
  }
}

class TimeTablePage extends StatelessWidget {
  const TimeTablePage({
    Key? key,
    required this.dayList,
    required this.currentTheme,
    required this.day,
  }) : super(key: key);

  final List<ScheduleModel>? dayList;
  final ThemeData currentTheme;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //! schedule list
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: Column(
            children: [
              dayList == null || dayList!.isEmpty ? 150.sbH : 100.sbH,
              if (dayList == null || dayList!.isEmpty)
                SizedBox(
                  height: height(context),
                  width: width(context),
                  child: Center(
                    child: Column(
                      children: [
                       160.sbH,
                        Text(
                          'No activities today',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (dayList != null)
                Column(
                  children: List.generate(
                    dayList!.length,
                    (index) => TimeTableTile(
                      schedule: dayList![index],
                      // color: getRandomColor(),
                    ),
                  ).animate(interval: 100.ms).slide(duration: 300.ms).fadeIn(),
                ),
            ],
          ),
        ),

        //! day
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              10.sbH,
              Opacity(
                opacity: 0.85,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
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
                  child: Center(
                    child: Text(
                      day,
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
