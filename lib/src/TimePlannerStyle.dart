import 'package:flutter/material.dart';

class TimePlannerStyle {
  /// Height of each cell in time planner
  int cellHeight;

  /// Width of each cell in time planner
  int cellWidth;

  /// Colors of main divider (under the title and next to hours)
  Color dividerColor;

  /// Background colors of time planner
  Color backgroundColor;
  
  TimePlannerStyle({
    this.cellHeight,
    this.cellWidth,
    this.dividerColor,
    this.backgroundColor,
  });
}
