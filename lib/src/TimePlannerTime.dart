import 'package:flutter/material.dart';
import 'config/GlobalConfig.dart' as Config;

/// Show the hour for each row of time planner
class TimePlannerTime extends StatelessWidget {
  /// Text it will be show as hour
  final String? time;

  /// Show the hour for each row of time planner
  const TimePlannerTime({
    Key? key,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.cellHeight!.toDouble() - 1,
      width: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: Center(child: Text(time!)),
      ),
    );
  }
}
