// import 'package:easy_localization/easy_localization.dart';
//
// import '../../main_importants.dart';
//
// class ClickHereToRegister extends StatelessWidget {
//   const ClickHereToRegister({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.login,
//       children: [
//         TextButton(
//           onPressed: (){
//             showLoginBottomSheet(context);
//           },
//          child: Text( LocaleKeys.toRegisterClickHere.tr(),style: AppStyles.black16Bold,)),
//       ],
//     );
//   }
// }
//
//
//
//
// showLoginBottomSheet(context)=>  showModalBottomSheet(
//   context: context,
//   backgroundColor: Colors.white,
//   clipBehavior: Clip.antiAlias,
//   constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.30),
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(20),
//       topRight: Radius.circular(20),
//     ),
//   ),
//   builder: (context) => const LoginBottomSheet(),
// );
//
//
// class LoginBottomSheet extends StatelessWidget {
//   const LoginBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(LocaleKeys.login.tr(),style: AppStyles.main16SemiBold,),
//               InkWell(
//                   onTap: (){
//                     Navigator.pop(context);
//                   },
//                   child: Icon(Icons.close)),
//             ],
//           ),
//           verticalSpace(15),
//           SvgPicture.asset(SvgImages.login, width: MediaQuery.of(context).size.width * 0.2),
//           verticalSpace(30),
//           Row(
//             children: [
//               Expanded(
//                 child: CustomButton(
//                     btnColor: Colors.white,
//                     borderColor: AppColors.whiteColor,
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     btnText:Text(LocaleKeys.cancel.tr(),style: AppStyles.black16Medium,)
//                 ),
//               ),
//               horizontalSpace(15),
//               Expanded(
//                 child: CustomButton(
//                     onPressed: () {
//                       AppNav.customNavigator(context: context, screen: OnBoardingView(),finish: true);
//                     },
//                     btnText:Text(LocaleKeys.login.tr(),style: AppStyles.white16SemiBold,)
//                 ),
//               ),
//
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }