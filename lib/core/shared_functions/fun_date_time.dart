import '../../main_importants.dart';

Future<DateTime?> selectDate(BuildContext context, {DateTime? initialDate, DateTime? firstDate, DateTime? lastDate}) async {
  return await showDatePicker(
    context: context,
    builder: (context, child) => pickTheme(context, child),
    initialDate: initialDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime.now(),
    initialEntryMode: DatePickerEntryMode.calendarOnly,
    lastDate: lastDate ?? DateTime.now().add(const Duration(days: 364)),
  );
}


Future<DateTime?> selectTime(BuildContext context, DateTime date) async {
  await showTimePicker(
    context: context,
    builder: (context, child) => pickTheme(context, child),
    initialTime: TimeOfDay.now(),
    initialEntryMode: TimePickerEntryMode.dialOnly,
  ).then((selectedTime){
    if(selectedTime == null) {
      return null;
    } else {
      date = date.copyWith(hour: selectedTime.hour, minute: selectedTime.minute);
    }
  });
  return date;
}

Theme pickTheme(BuildContext context, Widget? child) => Theme(
  data: Theme.of(context).copyWith(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.whiteColor,
      onSecondary:AppColors.primary,
      tertiary: AppColors.primary,
      secondary: AppColors.white,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
      ),
    ),
  ),
  child: child!,
);