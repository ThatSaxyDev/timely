// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:timely/features/time_table/views/edit_schedule_view.dart';
import 'package:timely/features/utils/nav.dart';
import 'package:timely/features/utils/utils.dart';
import 'package:timely/features/utils/widget_extensions.dart';

import 'package:timely/models/schedule_model.dart';
import 'package:timely/theme/palette.dart';

import '../views/add_schedule.dart';

class TimeTableTile extends ConsumerStatefulWidget {
  final ScheduleModel schedule;
  final void Function()? onTap;
  final Color? color;
  const TimeTableTile({
    super.key,
    required this.schedule,
    this.onTap,
    this.color,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimeTableTileState();
}

class _TimeTableTileState extends ConsumerState<TimeTableTile> {
  final CarouselController _controller = CarouselController();
  int page = 0;

  void _showPopupMenu(BuildContext context) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final result = await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(Offset.zero, overlay.size.bottomRight(Offset.zero)),
        Offset.zero & overlay.size,
      ),
      items: [
        PopupMenuItem(
          child: Text('Delete'),
        ),
      ],
    );

    if (result != null) {
      // Do something with the selected option
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeNotifierProvider);
    return InkWell(
      onTap: () {
        _controller.nextPage();
      },
      onLongPress: () {
        _showPopupMenu(context);
      },
      child: SizedBox(
        height: 90.h,
        width: width(context),
        child: Stack(
          children: [
            Container(
              height: 90.h,
              width: width(context),
              // margin: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                color: getRandomColor(),
                border: Border.all(
                  color: currentTheme.backgroundColor,
                ),
              ),
            ),
            Container(
              height: 90.h,
              width: width(context),
              // margin: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                border: Border.all(
                  color: currentTheme.backgroundColor,
                ),
              ),
              child: CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  viewportFraction: 1,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                ),
                items: [
                  //! front
                  Container(
                    padding: 20.padH,
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            // widget.schedule.id.toString(),
                            DateFormat('h:mm a').format(
                                widget.schedule.datesAndTimes[0].beginAt),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                                color: Pallete.whiteColor),
                          ),
                          10.sbW,
                          Text(
                            widget.schedule.title,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30.sp,
                                color: Pallete.whiteColor),
                          )
                        ],
                      ),
                    ),
                  ),

                  //! second
                  Container(
                    padding: 20.padH,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    DateFormat('h:mm a').format(widget
                                        .schedule.datesAndTimes[0].beginAt),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: Pallete.whiteColor),
                                  ),
                                  5.sbW,
                                  Icon(Icons.arrow_forward_ios_rounded,
                                      size: 16.sp, color: Pallete.whiteColor),
                                  5.sbW,
                                  Text(
                                    DateFormat('h:mm a').format(
                                        widget.schedule.datesAndTimes[0].endAt),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: Pallete.whiteColor),
                                  ),
                                ],
                              ),
                              if (widget.schedule.info.isNotEmpty)
                                SizedBox(
                                  width: 250.w,
                                  child: Text(
                                    widget.schedule.info,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp,
                                        color: Pallete.whiteColor),
                                  ),
                                ),
                            ],
                          ),

                          //! edit
                          Container(
                            decoration: BoxDecoration(
                                color: Pallete.whiteColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(7.r)),
                            child: TextButton.icon(
                              onPressed: () {
                                navigateToViews(
                                    context,
                                    EditScheduleView(
                                        schedule: widget.schedule));
                              },
                              icon: Icon(
                                PhosphorIcons.pencil,
                                color: Pallete.whiteColor,
                              ),
                              label: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Pallete.whiteColor,
                                ),
                              ),
                            ),
                          )
                        ],
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
