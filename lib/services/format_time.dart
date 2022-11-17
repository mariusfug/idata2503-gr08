import 'package:intl/intl.dart';

class FormatTime {
  /// Formats a given timestamp as a human-readable string, based on the
  /// timestamp value relative to current time
  static String formatTime(DateTime timestamp) {
    DateTime currentTime = DateTime.now();
    Duration difference;
    int differenceInSeconds;
    double differenceInMinutes;
    double differenceInHours;
    double differenceInDays;

    difference = currentTime.difference(timestamp);
    differenceInSeconds = difference.inSeconds;
    differenceInMinutes = (differenceInSeconds / 60);
    differenceInHours = (differenceInMinutes / 60);
    differenceInDays = (differenceInHours / 24);

    // Difference less than 1 second
    if (differenceInSeconds > -1 && differenceInSeconds < 1) {
      return "now";
    }
    // 1 second in the past
    else if (differenceInSeconds == 1) {
      return "1s";
    }
    // 1 or more seconds in the future
    else if (differenceInSeconds < -1) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss');
      return formatter.format(timestamp);
    }
    // 2 to 59 seconds in the past
    else if (differenceInSeconds >= 2 && differenceInSeconds <= 59) {
      return "${differenceInSeconds}s";
    }
    // Between 1 and 59 minutes
    else if (differenceInMinutes >= 1 && differenceInMinutes <= 59) {
      return "${differenceInMinutes.round()}min";
    }
    // Less than 24 hours
    else if (differenceInHours < 24) {
      return "${differenceInHours.round()}h";
    }
    // Between 24 and 36 hours
    else if (differenceInHours >= 24 && differenceInHours < 36) {
      return "1d";
    }
    // More or equal to 36 hours but less than 7 days
    else if (differenceInHours >= 36 && differenceInDays < 7) {
      return "${differenceInDays.round()}d";
    }
    // More than 7 days in the past
    else if (differenceInDays >= 7) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      return formatter.format(timestamp);
    }

    return "";
  }
}
