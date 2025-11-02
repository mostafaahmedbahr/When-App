import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateFormatterClass {
  // Format: "2025-10-12 00:00:00.000" to various styles

  /// Convert to timeago format (e.g., "in about a year")
  static String toTimeAgo(String? dateTimeString) {
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

  /// Convert to date only: "2025-10-12"
  static String toDateOnly(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return DateFormat('yyyy-MM-dd').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  /// Convert to readable date: "October 12, 2025"
  static String toReadableDate(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return DateFormat('MMMM dd, yyyy').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  /// Convert to short date: "Oct 12, 2025"
  static String toShortDate(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return DateFormat('MMM dd, yyyy').format(parsedDate);
    } catch (e) {
      return '';
    }

  }
  /// Convert to time only: "12:00 AM"
  static String toTimeOnly(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return DateFormat('hh:mm a').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  /// Convert to time only with multiple format support
  static String toTimeOnly2(
      String? dateTimeString, {
        String fallback = '',
        List<String>? inputFormats,
      }) {
    if (dateTimeString == null || dateTimeString.isEmpty) {
      return fallback;
    }

    DateTime? parsedDate;

    try {
      // المحاولة الأولى: استخدام DateTime.parse الافتراضي
      parsedDate = DateTime.parse(dateTimeString.trim());
    } catch (e) {
      // المحاولة الثانية: استخدام تنسيقات مخصصة إذا كانت متوفرة
      if (inputFormats != null) {
        parsedDate = _tryCustomFormats(dateTimeString, inputFormats);
      }
    }

    if (parsedDate == null ) {
      return fallback;
    }

    return DateFormat('hh:mm a', 'en').format(parsedDate);
  }
  /// Convert to time only: "10:40 PM"
  static String toTimeOnly3(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      // إذا كانت السلسلة تحتوي على وقت فقط (مثل: 22:40:07)
      if (dateTimeString.contains(':') && !dateTimeString.contains('-')) {
        // تقسيم الوقت إلى أجزاء
        final parts = dateTimeString.split(':');
        if (parts.length >= 2) {
          final hour = int.parse(parts[0]);
          final minute = int.parse(parts[1]);

          // إنشاء تاريخ افتراضي مع الوقت المطلوب
          final now = DateTime.now();
          final timeDate = DateTime(now.year, now.month, now.day, hour, minute);

          return DateFormat('hh:mm a').format(timeDate);
        }
      }

      // إذا كانت سلسلة تاريخ كاملة
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return DateFormat('hh:mm a').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  /// Convert any time/date string to 12-hour format
  static String to12HourFormat(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '--:--';

    try {
      final cleanString = dateTimeString.trim();

      // حالة 1: وقت فقط (22:40:07 أو 22:40)
      if (_isTimeOnly(cleanString)) {
        return _convertTimeOnly(cleanString);
      }

      // حالة 2: تاريخ ووقت كامل
      DateTime parsedDate = DateTime.parse(cleanString);
      return DateFormat('hh:mm a').format(parsedDate);

    } catch (e) {
      debugPrint('Time conversion error: $e');
      return '--:--';
    }
  }

  static bool _isTimeOnly(String timeString) {
    final timePattern = RegExp(r'^(\d{1,2}):(\d{2})(:(\d{2}))?$');
    return timePattern.hasMatch(timeString);
  }

  static String _convertTimeOnly(String timeString) {
    final parts = timeString.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    final displayMinute = minute.toString().padLeft(2, '0');

    return '$displayHour:$displayMinute $period';
  }

  static DateTime? _tryCustomFormats(String dateString, List<String> formats) {
    for (final format in formats) {
      try {
        final formatPattern = DateFormat(format);
        return formatPattern.parse(dateString);
      } catch (e) {
        continue;
      }
    }
    return null;
  }

  /// Convert to 24-hour time: "00:00"
  static String to24HourTime(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return DateFormat('HH:mm').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  /// Convert to date and time: "October 12, 2025 at 12:00 AM"
  static String toDateTime(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return DateFormat('MMMM dd, yyyy \'at\' hh:mm a').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  /// تحويل التاريخ إلى تنسيق  مثل: 2001-11-8
  static String toNormalFormat(DateTime date) {
    try {
      return '${date.year}-${date.month}-${date.day}';
    } catch (e) {
      return '';
    }
  }

  /// Convert to compact datetime: "10/12/2025, 12:00 AM"
  static String toCompactDateTime(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return DateFormat('MM/dd/yyyy, hh:mm a').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  /// Convert to ISO format: "2025-10-12T00:00:00.000"
  static String toIsoFormat(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return parsedDate.toIso8601String();
    } catch (e) {
      return '';
    }
  }

  /// Convert to relative day: "Today", "Tomorrow", "Yesterday", or date
  static String toRelativeDay(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      DateTime now = DateTime.now();
      DateTime today = DateTime(now.year, now.month, now.day);
      DateTime inputDate = DateTime(parsedDate.year, parsedDate.month, parsedDate.day);

      if (inputDate == today) {
        return 'Today';
      } else if (inputDate == today.add(Duration(days: 1))) {
        return 'Tomorrow';
      } else if (inputDate == today.subtract(Duration(days: 1))) {
        return 'Yesterday';
      } else {
        return DateFormat('MMM dd, yyyy').format(parsedDate);
      }
    } catch (e) {
      return '';
    }
  }

  /// Convert to day of week: "Sunday", "Monday", etc.
  static String toDayOfWeek(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return DateFormat('EEEE').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  /// Convert to short day of week: "Sun", "Mon", etc.
  static String toShortDayOfWeek(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return DateFormat('EEE').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  /// Convert to month and year: "October 2025"
  static String toMonthYear(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return DateFormat('MMMM yyyy').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  /// Convert to month and day: "October 12"
  static String toMonthDay(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return DateFormat('MMMM dd').format(parsedDate); // الشهر واليوم فقط
    } catch (e) {
      return '';
    }
  }
  /// Convert to timestamp (milliseconds since epoch)
  static int toTimestamp(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return 0;
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return parsedDate.millisecondsSinceEpoch;
    } catch (e) {
      return 0;
    }
  }

  /// Check if date is today
  static bool isToday(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return false;
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      DateTime now = DateTime.now();
      return parsedDate.year == now.year &&
          parsedDate.month == now.month &&
          parsedDate.day == now.day;
    } catch (e) {
      return false;
    }
  }

  /// Check if date is in the future
  static bool isFuture(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return false;
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return parsedDate.isAfter(DateTime.now());
    } catch (e) {
      return false;
    }
  }

  /// Get difference in days from now
  static int daysFromNow(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return 0;
    try {
      DateTime parsedDate = DateTime.parse(dateTimeString);
      return DateTime.now().difference(parsedDate).inDays;
    } catch (e) {
      return 0;
    }
  }
}