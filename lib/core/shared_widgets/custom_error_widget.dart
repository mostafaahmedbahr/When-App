import '../../main_importants.dart';

 class CustomErrorWidget extends StatelessWidget {
    const CustomErrorWidget({super.key , required this.onTap, required this.errorMsg});
  final void Function()? onTap;
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SvgImages.serverErrorImage,
            colorFilter: const ColorFilter.mode(
              AppColors.gray100,
              BlendMode.srcIn,
            ),
          ),
          verticalSpace(10),
          InkWell(
              onTap: onTap,
              child:     Text(errorMsg,
              style: const TextStyle(
                color: AppColors.blackColor,
              ),),),
        ],
      ),
    );
  }
}
