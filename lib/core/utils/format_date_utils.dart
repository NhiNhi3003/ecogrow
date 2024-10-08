import 'package:intl/intl.dart';

class FormatDateUtils {
  static String formatDateTime(DateTime dateTime) {
    DateFormat formatter = DateFormat('HH:mm:ss dd/MM/yyyy');
    return formatter.format(dateTime);
  }
}
