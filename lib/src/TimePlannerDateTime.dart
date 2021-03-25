class TimePlannerDateTime {
  /// Day index from 0, this index dependence on your time planner header
  int day;

  /// Task will be begin at this hour
  int hour;

  /// Task will be begin at this minutes
  int minutes;

  TimePlannerDateTime(
      {required this.day, required this.hour, required this.minutes});
}
