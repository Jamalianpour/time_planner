import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:time_planner/time_planner.dart';

void main() {
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time planner Demo',
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Time planner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TimePlannerTask> tasks = [];

  void _addObject(BuildContext context) {
    List<Color?> colors = [
      Colors.purple,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.lime[600]
    ];

    setState(() {
      int day = Random().nextInt(14);
      int hour = Random().nextInt(18) + 6;
      int minutes = Random().nextInt(60);
      int daysDuration = Random().nextInt(4) + 1;
      int minutesDuration = Random().nextInt(90) + 30;
      tasks.add(
        TimePlannerTask(
          cardElevation: 0,
          color: colors[Random().nextInt(colors.length)],
          dateTime: TimePlannerDateTime(
              day: day,
              hour: hour,
              minutes: minutes),
          minutesDuration: minutesDuration,
          daysDuration: daysDuration,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('You click on time planner object')));
          },
          child: Text(
            'day: $day, time: $hour:$minutes, minutes duration: $minutesDuration, days duration: $daysDuration',
            style: TextStyle(color: Colors.grey[350], fontSize: 12),
          ),
        ),
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Random task added to time planner!'), duration: Duration(milliseconds: 100),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: TimePlanner(
          startHour: 6,
          endHour: 23,
          use24HourFormat: false,
          style: TimePlannerStyle(
            cellHeight: 120,
            cellWidth: 282,
            showScrollBar: true,
            dividerColor: Colors.transparent,
            headerContainerDecoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff030303).withOpacity(0.08),
                  blurRadius: 12,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                )
              ]
            )
          ),
          headers: const [
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
            TimePlannerTitle(
              date: "3/13/2021",
              title: "wednesday",
            ),
            TimePlannerTitle(
              date: "3/14/2021",
              title: "thursday",
            ),
            TimePlannerTitle(
              date: "3/15/2021",
              title: "friday",
            ),
            TimePlannerTitle(
              date: "3/16/2021",
              title: "saturday",
            ),
            TimePlannerTitle(
              date: "3/17/2021",
              title: "sunday",
            ),
            TimePlannerTitle(
              date: "3/18/2021",
              title: "monday",
            ),
            TimePlannerTitle(
              date: "3/19/2021",
              title: "tuesday",
            ),
            TimePlannerTitle(
              date: "3/20/2021",
              title: "wednesday",
            ),
            TimePlannerTitle(
              date: "3/21/2021",
              title: "thursday",
            ),
            TimePlannerTitle(
              date: "3/22/2021",
              title: "friday",
            ),
            TimePlannerTitle(
              date: "3/23/2021",
              title: "saturday",
            ),
            TimePlannerTitle(
              date: "3/24/2021",
              title: "tuesday",
            ),
            TimePlannerTitle(
              date: "3/25/2021",
              title: "wednesday",
            ),
            TimePlannerTitle(
              date: "3/26/2021",
              title: "thursday",
            ),
            TimePlannerTitle(
              date: "3/27/2021",
              title: "friday",
            ),
            TimePlannerTitle(
              date: "3/28/2021",
              title: "saturday",
            ),
            TimePlannerTitle(
              date: "3/29/2021",
              title: "friday",
            ),
            TimePlannerTitle(
              date: "3/30/2021",
              title: "saturday",
            ),
          ],
          tasks: tasks,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addObject(context),
        tooltip: 'Add random task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
