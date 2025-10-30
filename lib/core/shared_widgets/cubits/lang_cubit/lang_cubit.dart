 import 'package:easy_localization/easy_localization.dart';
 import '../../../../main_importants.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(_getSavedLocale());

   static Locale _getSavedLocale() {
    final savedLanguage = CacheHelper.getData(key: 'language');
    if (savedLanguage != null) {
      return Locale(savedLanguage, '');
    }
    return const Locale('ar', '');
  }

  void changeLanguage(BuildContext context, Locale locale) {
    CacheHelper.saveData(key: 'language', value: locale.languageCode);
    EasyLocalization.of(context)?.setLocale(locale);
    emit(locale);
  }
}