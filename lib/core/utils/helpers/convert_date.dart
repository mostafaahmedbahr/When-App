import 'package:timeago/timeago.dart' as timeago;

String formatDateTime(String? dateTimeString) {
  if (dateTimeString == null || dateTimeString.isEmpty) {
    return 'Just now';
  }
  try {
    DateTime parsedDate = DateTime.parse(dateTimeString);
    return timeago.format(parsedDate, locale: 'en');
  } catch (e) {
    return 'Just now';
  }
}