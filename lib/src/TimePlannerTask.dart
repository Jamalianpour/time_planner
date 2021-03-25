import 'package:flutter/material.dart';

import 'TimePlannerDateTime.dart';
import 'config/GlobalConfig.dart' as Config;

/// Widget that show on time planner as the tasks
class TimePlannerTask extends StatelessWidget {
  /// Duration of task or object
  final int minutes;

  /// When this task will be happen
  final TimePlannerDateTime dateTime;

  /// Background color of task
  final Color? color;

  /// This will be happen when user tap on task, for example show a dialog or navigate to other page
  final Function? onTap;

  /// Show this child on the task
  ///
  /// Typically an [Text].
  final Widget? child;

  /// Widget that show on time planner as the tasks
  const TimePlannerTask({
    Key? key,
    required this.minutes,
    required this.dateTime,
    this.color,
    this.onTap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ((Config.cellHeight! * (dateTime.hour - Config.startHour)) +
              ((dateTime.minutes * Config.cellHeight!) / 60))
          .toDouble(),
      left: Config.cellWidth! * dateTime.day.toDouble(),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: Stack(
          children: [
            InkWell(
              onTap: onTap as void Function()? ?? () {},
              child: Container(
                height: ((minutes.toDouble() * Config.cellHeight!) /
                    60), //60 minutes
                width: Config.cellWidth!.toDouble(),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: color ?? Theme.of(context).primaryColor),
                child: Center(
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
