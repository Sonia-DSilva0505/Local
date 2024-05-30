import 'package:intl/intl.dart';

class AppDateUtil {
  static String dob(String date) {
    return DateFormat('dd / MM / yyyy').format(DateTime.parse(date)).toString();
  }

  static String formatDate(DateTime dateTime) {
    // Format the day with "d" (day of the month).
    String day = DateFormat('d').format(dateTime);

    // Determine the day suffix (st, nd, rd, or th).
    String daySuffix = _getDaySuffix(int.parse(day));

    // Format the month with "MMMM" (full month name) and the year with "y" (year).
    String formattedDate = DateFormat('MMMM, y').format(dateTime);

    // Concatenate the formatted day, month, and year with the appropriate suffix.
    return '$day$daySuffix $formattedDate';
  }

  static String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
