import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  var currentDate = DateTime.now().obs;

  String getFormattedDate(String locale) {
    return DateFormat('EEEE, dd MMMM yyyy', locale).format(currentDate.value);
  }
  
  String getFormattedTime() {
    return DateFormat('HH:mm:ss').format(currentDate.value);
  }

  void updateCurrentDate() {
    currentDate.value = DateTime.now();
  }
}
