# Time planner

![Pub Version](https://img.shields.io/pub/v/time_planner)

A beautiful, easy to use and customizable time planner for flutter mobile 📱, desktop 🖥 and web 🌐

This is a widget for show tasks to user on a time table.  
Each row show a hour and each column show a day but you can change the title of column and show any things else you want.

## Screenshots

| Mobile                                 | Dark                                    |
| -------------------------------------- | --------------------------------------- |
| ![Notification](screenshot/Mobile.gif) | ![Attached](screenshot/darkMobile.jpg) |

| Desktop                                 | Web                             |
| --------------------------------------- | ------------------------------- |
| ![Notification](screenshot/Desktop.gif) | ![Attached](screenshot/Web.gif) |

## Usage

##### 1. add dependencies into you project pubspec.yaml file

```yaml
dependencies:
  time_planner: ^0.0.1
```

##### 2. import time planner lib

```dart
import 'package:time_planner/time_planner.dart';
```

##### 3. use time planner

```dart
List<TimePlannerTask> tasks = [
  TimePlannerTask(
    // background color for task
    color: Colors.purple,
    // day: Index of header, hour: Task will be begin at this hour
    // minutes: Task will be begin at this minutes
    dateTime: TimePlannerDateTime(day: 0, hour: 14, minutes: 30),
    // duration of task
    minutes: 90,
    onTap: () {},
    child: Text(
      'this is a task',
      style: TextStyle(color: Colors.grey[350], fontSize: 12),
    ),
  ),
];
```

```dart
TimePlanner(
  // time will be start at this hour on table
  startHour: 6,
  // time will be end at this hour on table
  endHour: 24,
  // each header is a column and a day
  headers: [
    TimePlannerTitle(
      date: "3/10/2021",
      title: "sunday",
    ),
    TimePlannerTitle(
      date: "3/11/2021",
      title: "monday",
    ),
    TimePlannerTitle(
      date: "3/12/2021",
      title: "tuesday",
    ),
  ],
  // List of task will be show on the time planner
  tasks: tasks,
),
```

### Style

you can change style of time planner with `TimePlannerStyle` :

```dart
style: TimePlannerStyle(
  backgroundColor: Colors.blueGrey[900],
  // default value for height is 80
  cellHeight: 60,
  // default value for width is 80
  cellWidth: 60,
  dividerColor: Colors.white,
),
```

when time planner widget loaded it will be scroll to current local hour and this futrue is true by default, you can turn this off like this:

```dart
currentTimeAnimation: false,
```

---

Fill free to fork this repository and send pull request 🏁👍
