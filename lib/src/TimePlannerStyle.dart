import 'package:flutter/material.dart';

class TimePlannerStyle {
  /// Height of each cell in time planner, default is 90.
  int? cellHeight;

  /// Width of each cell in time planner, default is 80.
  int? cellWidth;

  /// Colors of main divider (under the title and next to hours)
  Color? dividerColor;

  /// Background colors of time planner
  Color? backgroundColor;

  /// Show horizontal and vertical [scrollBar] on time planner, default is false.
  bool? showScrollBar;

  TimePlannerStyle(
      {this.cellHeight,
      this.cellWidth,
      this.dividerColor,
      this.backgroundColor,
      this.showScrollBar});
}
