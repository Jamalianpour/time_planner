import 'package:flutter/material.dart';
import 'config/GlobalConfig.dart' as Config;

/// Title widget for time planner
class TimePlannerTitle extends StatelessWidget {
  /// Title of each day, typically is name of the day for example sunday
  ///
  /// but you can set any things here
  final String title;

  /// Text style for title
  final TextStyle? titleStyle;

  /// Date of each day like 03/21/2021 but you can leave it empty or write other things
  final String? date;

  /// Text style for date text
  final TextStyle? dateStyle;

  /// Title widget for time planner
  const TimePlannerTitle({
    Key? key,
    required this.title,
    this.date,
    this.titleStyle,
    this.dateStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Config.cellWidth!.toDouble(),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: titleStyle ?? TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              date ?? '',
              style: dateStyle ?? TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
