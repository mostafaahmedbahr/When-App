
import '../../main_importants.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, this.maxLines,  this.textColor,   this.fontSize,   this.fontWeight,   this.textOverflow , this.decoration, this.style, this.textAlign});
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextDecoration? decoration;
  final TextStyle? style;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? TextStyle(
        decoration: decoration,
        color: textColor ?? AppColors.whiteColor,
        fontSize: fontSize,
        fontWeight:fontWeight,
        fontFamily: "Cairo",
      ),
      textAlign: textAlign?? TextAlign.center,
    );
  }
}