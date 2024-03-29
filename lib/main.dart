import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SfCalendar(
            view: CalendarView.week,
            allowedViews: const [
              CalendarView.day,
              CalendarView.week,
              CalendarView.workWeek,
              CalendarView.timelineDay,
              CalendarView.timelineWeek,
              CalendarView.timelineWorkWeek,
            ],
            dataSource: getCalendarDataSource(),
            specialRegions: _getTimeRegions(),
          ),
        ),
      ),
    );
  }

  _DataSource getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: 'Meeting',
      color: Colors.pink,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 4)),
      endTime: DateTime.now().add(const Duration(hours: 5)),
      subject: 'Release Meeting',
      color: Colors.lightBlueAccent,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 6)),
      endTime: DateTime.now().add(const Duration(hours: 7)),
      subject: 'Performance check',
      color: Colors.amber,
    ));
    appointments.add(Appointment(
      startTime: DateTime(2020, 1, 22, 1, 0, 0),
      endTime: DateTime(2020, 1, 22, 3, 0, 0),
      subject: 'Support',
      color: Colors.green,
    ));
    appointments.add(Appointment(
      startTime: DateTime(2020, 1, 24, 3, 0, 0),
      endTime: DateTime(2020, 1, 24, 4, 0, 0),
      subject: 'Retrospective',
      color: Colors.purple,
    ));

    return _DataSource(appointments);
  }

  List<TimeRegion> _getTimeRegions() {
    final List<TimeRegion> regions = <TimeRegion>[];
    regions.add(TimeRegion(
        startTime: DateTime(2020, 5, 29, 13, 0, 0),
        endTime: DateTime(2020, 5, 29, 14, 0, 0),
        recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=MON,TUE,WED,THU,FRI',
        text: "Lunch",
        color: const Color(0xFFBD3D3D3),
        enablePointerInteraction: true,
        textStyle: const TextStyle(
          color: Colors.black,
        )));

    return regions;
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}