import 'package:flutter/material.dart';
import 'package:time_planner/src/TimePlannerStyle.dart';

import 'TimePlannerTask.dart';
import 'TimePlannerTime.dart';
import 'TimePlannerTitle.dart';
import 'config/GlobalConfig.dart' as Config;

/// Time planner widget
class TimePlanner extends StatefulWidget {
  /// Time start from this, it will start from 1
  final int startHour;

  /// Time end at this hour, max value is 24
  final int endHour;

  /// Create days from here, each day is a TimePlannerTitle.
  ///
  /// you should create at least one day
  final List<TimePlannerTitle> headers;

  /// List of widgets on time planner
  final List<TimePlannerTask>? tasks;

  /// Style of time planner
  final TimePlannerStyle? style;

  /// When widget loaded scroll to current time with an animation. Default is true
  final bool? currentTimeAnimation;

  /// Time planner widget
  const TimePlanner({
    Key? key,
    required this.startHour,
    required this.endHour,
    required this.headers,
    this.tasks,
    this.style,
    this.currentTimeAnimation,
  }) : super(key: key);
  @override
  _TimePlannerState createState() => _TimePlannerState();
}

class _TimePlannerState extends State<TimePlanner> {
  ScrollController mainHorizontalController = ScrollController();
  ScrollController mainVerticalController = ScrollController();
  ScrollController dayHorizontalController = ScrollController();
  ScrollController timeVerticalController = ScrollController();
  TimePlannerStyle style = TimePlannerStyle();
  List<TimePlannerTask> tasks = [];
  bool? isAnimated = true;

  /// check input value for rules
  void _checkInputValue() {
    if (widget.startHour > widget.endHour) {
      throw FlutterError("Start hour sholud be lower than end hour");
    } else if (widget.startHour < 1) {
      throw FlutterError("Start hour sholud be larger than 1");
    } else if (widget.endHour > 24) {
      throw FlutterError("Start hour sholud be lower than 24");
    } else if (widget.headers.isEmpty) {
      throw FlutterError("header can\'t be empty");
    }
  }

  /// create local style
  void _convertToLocalStyle() {
    style.backgroundColor = widget.style?.backgroundColor ?? null;
    style.cellHeight = widget.style?.cellHeight ?? 80;
    style.cellWidth = widget.style?.cellWidth ?? 90;
    style.dividerColor = widget.style?.dividerColor ?? null;
    style.showScrollBar = widget.style?.showScrollBar ?? false;
  }

  /// store input data to static values
  void _initData() {
    _checkInputValue();
    _convertToLocalStyle();
    Config.cellHeight = style.cellHeight;
    Config.cellWidth = style.cellWidth;
    Config.totalHours = (widget.endHour - widget.startHour).toDouble();
    Config.totalDays = widget.headers.length;
    Config.startHour = widget.startHour;
    isAnimated = widget.currentTimeAnimation;
    tasks = widget.tasks ?? [];
  }

  @override
  void initState() {
    _initData();
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      int hour = DateTime.now().hour;
      if (hour > widget.startHour) {
        double scrollOffset =
            (hour - widget.startHour) * Config.cellHeight!.toDouble();
        mainVerticalController.animateTo(scrollOffset,
            duration: Duration(milliseconds: 800), curve: Curves.easeOutCirc);
        timeVerticalController.animateTo(scrollOffset,
            duration: Duration(milliseconds: 800), curve: Curves.easeOutCirc);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mainHorizontalController.addListener(() {
      dayHorizontalController.jumpTo(mainHorizontalController.offset);
    });
    mainVerticalController.addListener(() {
      timeVerticalController.jumpTo(mainVerticalController.offset);
    });
    return GestureDetector(
      child: Container(
        color: style.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SingleChildScrollView(
              controller: dayHorizontalController,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                  ),
                  for (int i = 0; i < Config.totalDays; i++) widget.headers[i],
                ],
              ),
            ),
            Container(
              height: 1,
              color: style.dividerColor ?? Theme.of(context).primaryColor,
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: timeVerticalController,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            //first number is start hour and secound number is end hour
                            for (int i = widget.startHour;
                                i <= widget.endHour;
                                i++)
                              TimePlannerTime(
                                time: i.toString() + ':00',
                              ),
                          ],
                        ),
                        Container(
                          height: (Config.totalHours * Config.cellHeight!) + 80,
                          width: 1,
                          color: style.dividerColor ??
                              Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: buildMainBody(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMainBody() {
    if (style.showScrollBar!) {
      return Scrollbar(
        controller: mainVerticalController,
        child: SingleChildScrollView(
          controller: mainVerticalController,
          child: Scrollbar(
            controller: mainHorizontalController,
            child: SingleChildScrollView(
              controller: mainHorizontalController,
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: (Config.totalHours * Config.cellHeight!) + 80,
                        width:
                            (Config.totalDays * Config.cellWidth!).toDouble(),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                for (var i = 0; i < Config.totalHours; i++)
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(
                                        height:
                                            (Config.cellHeight! - 1).toDouble(),
                                      ),
                                      Divider(
                                        height: 1,
                                      ),
                                    ],
                                  )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                for (var i = 0; i < Config.totalDays; i++)
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(
                                        width:
                                            (Config.cellWidth! - 1).toDouble(),
                                      ),
                                      Container(
                                        width: 1,
                                        height: (Config.totalHours *
                                                Config.cellHeight!) +
                                            Config.cellHeight!,
                                        color: Colors.black12,
                                      )
                                    ],
                                  )
                              ],
                            ),
                            for (int i = 0; i < tasks.length; i++) tasks[i],
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return SingleChildScrollView(
      controller: mainVerticalController,
      child: SingleChildScrollView(
        controller: mainHorizontalController,
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: (Config.totalHours * Config.cellHeight!) + 80,
                  width: (Config.totalDays * Config.cellWidth!).toDouble(),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          for (var i = 0; i < Config.totalHours; i++)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(
                                  height: (Config.cellHeight! - 1).toDouble(),
                                ),
                                Divider(
                                  height: 1,
                                ),
                              ],
                            )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          for (var i = 0; i < Config.totalDays; i++)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(
                                  width: (Config.cellWidth! - 1).toDouble(),
                                ),
                                Container(
                                  width: 1,
                                  height:
                                      (Config.totalHours * Config.cellHeight!) +
                                          Config.cellHeight!,
                                  color: Colors.black12,
                                )
                              ],
                            )
                        ],
                      ),
                      for (int i = 0; i < tasks.length; i++) tasks[i],
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
