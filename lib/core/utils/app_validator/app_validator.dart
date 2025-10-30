// import 'package:easy_localization/easy_localization.dart';
// import '../../../lang/locale_keys.dart';
//
// class MyValidators {
//   static String? displayNameValidator(String? displayName) {
//     if (displayName == null || displayName.trim().isEmpty) {
//       return LocaleKeys.nameValidate.tr();
//     }
//
//     final trimmed = displayName.trim();
//
//     if (trimmed.length < 2) {
//       return LocaleKeys.nameTooShort.tr();
//     }
//
//     if (trimmed.length > 50) {
//       return LocaleKeys.nameTooLong.tr();
//     }
//
//     if (RegExp(r'[0-9]').hasMatch(trimmed)) {
//       return LocaleKeys.nameNoNumbers.tr();
//     }
//
//     if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(trimmed)) {
//       return LocaleKeys.nameNoSpecialChars.tr();
//     }
//
//     return null;
//   }
//
//   static String? displayMessageValidator(String? message) {
//     if (message == null || message.isEmpty) {
//       return LocaleKeys.messageValidate.tr();
//     }
//
//     if (message.length < 10) {
//       return LocaleKeys.messageTooShort.tr();
//     }
//
//     if (message.length > 500) {
//       return LocaleKeys.messageTooLong.tr();
//     }
//
//     return null;
//   }
//
//   static String? emailValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return LocaleKeys.emailValidate.tr();
//     }
//
//     final emailRegex = RegExp(
//         r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$'
//     );
//
//     if (!emailRegex.hasMatch(value)) {
//       return LocaleKeys.emailValidate2.tr();
//     }
//
//     if (value.contains(' ')) {
//       return LocaleKeys.emailNoSpaces.tr();
//     }
//
//     if (value.startsWith('.') || value.endsWith('.')) {
//       return LocaleKeys.emailInvalidDots.tr();
//     }
//
//     if ('@.'.allMatches(value).length > 1) {
//       return LocaleKeys.emailMultipleAt.tr();
//     }
//
//     return null;
//   }
//
//   static String? passwordValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return LocaleKeys.passwordValidate.tr();
//     }
//
//     final requirements = <String>[];
//
//     if (value.length < 8) {
//       requirements.add(LocaleKeys.passwordMinLength.tr());
//     }
//
//     if (value.length > 30) {
//       requirements.add(LocaleKeys.passwordMaxLength.tr());
//     }
//
//     if (!RegExp(r'[A-Z]').hasMatch(value)) {
//       requirements.add(LocaleKeys.passwordRequireUppercase.tr());
//     }
//
//     if (!RegExp(r'[a-z]').hasMatch(value)) {
//       requirements.add(LocaleKeys.passwordRequireLowercase.tr());
//     }
//
//     if (!RegExp(r'\d').hasMatch(value)) {
//       requirements.add(LocaleKeys.passwordRequireNumber.tr());
//     }
//
//     if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
//       requirements.add(LocaleKeys.passwordRequireSpecial.tr());
//     }
//
//     if (requirements.isNotEmpty) {
//       return '${LocaleKeys.passwordRequirements.tr()}:\n${requirements.join('\n')}';
//     }
//
//     return null;
//   }
//
//   static String? urlValidator(String? value, {bool isRequired = false}) {
//     if (isRequired && (value == null || value.isEmpty)) {
//       return LocaleKeys.urlRequired.tr();
//     }
//
//     if (value == null || value.isEmpty) {
//       return null;
//     }
//
//     final urlRegex = RegExp(
//         r'^(https?://)?'
//         r'([\w-]+\.)+[\w-]+'
//         r'(:\d+)?'
//         r'(/[\w-./?%&=]*)?$'
//     );
//
//     if (!urlRegex.hasMatch(value)) {
//       return LocaleKeys.urlInvalid.tr();
//     }
//
//     if (!value.startsWith('http://') && !value.startsWith('https://')) {
//       return LocaleKeys.urlMissingProtocol.tr();
//     }
//
//     return null;
//   }
//
//   static String? repeatPasswordValidator({String? value, String? password}) {
//     if (value == null || value.isEmpty) {
//       return LocaleKeys.repeatPasswordRequired.tr();
//     }
//
//     if (password == null || password.isEmpty) {
//       return LocaleKeys.enterPasswordFirst.tr();
//     }
//
//     if (value != password) {
//       return LocaleKeys.passwordsDontMatch.tr();
//     }
//
//     return null;
//   }
//
//   static String? phoneValidator(String? value, {String? countryCode}) {
//     if (value == null || value.isEmpty) {
//       return LocaleKeys.phoneRequired.tr();
//     }
//
//     final numericValue = value.replaceAll(RegExp(r'[^0-9]'), '');
//
//     switch (countryCode) {
//       case '+20':
//         if (!RegExp(r'^01[0-9]{9}$').hasMatch(numericValue)) {
//           return LocaleKeys.phoneEgyptInvalid.tr();
//         }
//         break;
//       case '+1':
//         if (numericValue.length != 10) {
//           return LocaleKeys.phoneUSInvalid.tr();
//         }
//         break;
//       default:
//         if (numericValue.length < 8 || numericValue.length > 15) {
//           return LocaleKeys.phoneInternationalInvalid.tr();
//         }
//     }
//
//     return null;
//   }
// }