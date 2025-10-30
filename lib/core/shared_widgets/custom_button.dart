


import '../../main_importants.dart';
import '../utils/app_styles/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,   this.height,   this.width,     this.btnColor, required this.btnText,required this.onPressed,   this.borderColor, this.radius});
  final double? height;
  final double? width;

  final Color? btnColor;
  final Color? borderColor;
  final double? radius;
  final Widget btnText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      height: height ?? 54,
      width: width ?? double.infinity,
      child:  ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
       //   textStyle: AppStyles.textStyle40W600White,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 8),
              side:   BorderSide(
                width: 1.0,
                color:borderColor ?? AppColors.primary,
              )
          ),
          backgroundColor: btnColor ?? AppColors.primary,
            foregroundColor : AppColors.primary,
        ),
        child:  btnText,
      ),
    );
  }
}