import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateController extends GetxController {
  var currentDate = DateTime.now().obs;

  String getFormattedDate(String locale) {
    initializeDateFormatting(locale, null);
    return DateFormat('EEEE, dd MMMM yyyy', locale).format(currentDate.value);
  }
  
  String getFormattedTime() {
    return DateFormat('HH:mm:ss').format(currentDate.value);
  }

  void updateCurrentDate() {
    currentDate.value = DateTime.now();
  }
}
