//
//
//
//
//
//
//
// import 'package:easy_localization/easy_localization.dart';
//
// import '../../main_importants.dart';
//
//
// class ContainerSearchWidget extends StatelessWidget {
//   const ContainerSearchWidget({
//     super.key,
//     this.controller,
//     this.onChanged,
//     this.onSubmitted,
//     this.onTap,
//     this.hintText,
//     this.readOnly = false,
//     this.prefixIconPadding = const EdgeInsets.all(14.0),
//     this.decoration,
//     this.style,
//     this.keyboardType = TextInputType.text,
//     this.textInputAction = TextInputAction.search,
//   });
//   final TextEditingController? controller;
//   final ValueChanged<String>? onChanged;
//   final ValueChanged<String>? onSubmitted;
//   final VoidCallback? onTap;
//   final String? hintText;
//   final bool readOnly;
//   final EdgeInsets prefixIconPadding;
//   final InputDecoration? decoration;
//   final TextStyle? style;
//   final TextInputType keyboardType;
//   final TextInputAction textInputAction;
//   @override
//   Widget build(BuildContext context) {
//     return CustomTextFormField(
//       controller: controller,
//       onChanged: onChanged,
//       onFieldSubmitted: onSubmitted,
//       onPressed: onTap,
//       readOnly: readOnly,
//       keyboardType: keyboardType,
//       hintText:  context.tr(LocaleKeys.search),
//       hintColor: AppColors.mainColor,
//       prefixIcon: Padding(
//         padding: const EdgeInsets.all(14.0),
//         child: SvgPicture.asset(SvgImages.search,colorFilter: ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn),),
//       ),
//     );
//   }
// }
