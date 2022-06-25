import 'package:flutter/material.dart';

class TimePlannerStyle {
  /// Height of each cell in time planner, default is 90.
  int? cellHeight;

  /// Width of each cell in time planner, default is 80.
  int? cellWidth;

  /// Horizontal padding (Left and Right) of each task in time planner, default is 0.
  double? horizontalTaskPadding;

  /// Colors of main divider (under the title and next to hours)
  Color? dividerColor;

  /// Background colors of time planner
  Color? backgroundColor;

  /// Show horizontal and vertical [scrollBar] on time planner, default is false.
  bool? showScrollBar;

  /// Border radius for tasks, default is `BorderRadius.all(Radius.circular(8.0))`
  BorderRadiusGeometry? borderRadius;

  TimePlannerStyle({
    this.cellHeight,
    this.cellWidth,
    this.dividerColor,
    this.backgroundColor,
    this.showScrollBar,
    this.horizontalTaskPadding,
    this.borderRadius,
  });
}
