import 'package:akademik_1/features/kegiatan/controller/calendar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:math';

class KegiatanTab extends StatelessWidget {
  final CalendarController calendarController = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CalendarSection(),
          JadwalKegiatanSection()
        ],
      ),
    );
  }

  Widget CalendarSection() {
    return Obx(() => Container(
          color: Color(0xffF6F5F5),
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: calendarController.focusedDay.value,
            calendarFormat: calendarController.calendarFormat.value,
            eventLoader: (day) => getEventsForDay(day),
            onFormatChanged: (format) {
              calendarController.setCalendarFormat(format);
            },
            onPageChanged: (focusedDay) {
              calendarController.setFocusedDay(focusedDay);
            },
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                if (events.isNotEmpty) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: getColorForDate(day),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${day.day}',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
        ));
  }

  Color getColorForDate(DateTime date) {
    final random = Random(date.day + date.month + date.year);
    final hue = random.nextDouble() * 360;
    final saturation =
        0.5 + random.nextDouble() * 0.5; // Saturation between 0.5 and 1.0
    final lightness =
        0.5 + random.nextDouble() * 0.5; // Lightness between 0.5 and 1.0
    return HSLColor.fromAHSL(1.0, hue, saturation, lightness).toColor();
  }

  Map<DateTime, List<Map<String, String>>> getEventsForMonth() {
    // Dummy data
    List<Map<String, String>> events = [
      {
        'title': 'Event 1',
        'date': '2024-07-10',
      },
      {
        'title': 'Event 2',
        'date': '2024-07-15',
      },
      {
        'title': 'Event 4',
        'date': '2024-06-10',
      },
      {
        'title': 'Event 3',
        'date': '2024-06-15',
      },
    ];

    // Group events by date
    Map<DateTime, List<Map<String, String>>> eventsMap = {};
    for (var event in events) {
      DateTime eventDate = DateTime.parse(event['date']!);
      if (!eventsMap.containsKey(eventDate)) {
        eventsMap[eventDate] = [];
      }
      eventsMap[eventDate]!.add(event);
    }

    return eventsMap;
  }

  List<Map<String, String>> getEventsForDay(DateTime day) {
    final eventsMap = getEventsForMonth();
    List<Map<String, String>> events = [];

    eventsMap.forEach((date, eventsList) {
      if (date.month == day.month &&
          date.year == day.year &&
          date.day == day.day) {
        events.addAll(eventsList);
      }
    });

    return events;
  }

  List<Map<String, String>> getEventsForCurrentMonth(DateTime focusedDay) {
    final eventsMap = getEventsForMonth();
    List<Map<String, String>> events = [];

    eventsMap.forEach((date, eventsList) {
      if (date.month == focusedDay.month && date.year == focusedDay.year) {
        events.addAll(eventsList);
      }
    });

    return events;
  }

  Widget JadwalKegiatanSection() {
    return Expanded(
      child: Obx(
        () {
          DateTime focusedDay = calendarController.focusedDay.value;
          List<Map<String, String>> events =
              getEventsForCurrentMonth(focusedDay);
          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jadwal Kegiatan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Berikut jadwal kegiatan di bulan ini',
                  style: TextStyle(fontSize: 12, color: Color(0xff575A61)),
                ),
                SizedBox(height: 10, width: double.infinity),
                ...events
                    .map((event) =>
                        _buildEventCard(event['title']!, event['date']!))
                    .toList(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEventCard(String title, String date) {
    return GestureDetector(
      onTap: () => Get.toNamed('/test_camera'),
      child: Card(
        elevation: 0,
        color: Color(0xff3D5CFF),
        margin: EdgeInsets.only(bottom: 20),
        child: SizedBox(
          height: 80,
          child: Padding(
            padding: EdgeInsets.all(13),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: AssetImage('images/Calendar.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(height: 10),
                    _buildEventDate(date)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventDate(String date) {
    return Row(
      children: [
        Icon(Icons.access_time_filled, color: Colors.white, size: 15),
        SizedBox(width: 5),
        Text(date, style: TextStyle(color: Colors.white, fontSize: 10)),
      ],
    );
  }
}
