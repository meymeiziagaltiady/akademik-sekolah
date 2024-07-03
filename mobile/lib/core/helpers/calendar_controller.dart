import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  var calendarFormat = CalendarFormat.month.obs;
  var focusedDay = DateTime.now().obs;

  void setCalendarFormat(CalendarFormat format) {
    calendarFormat.value = format;
  }

  void setFocusedDay(DateTime day) {
    focusedDay.value = day;
  }
}
