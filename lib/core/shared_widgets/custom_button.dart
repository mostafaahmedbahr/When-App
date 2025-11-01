 import '../../main_importants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height,
    this.width,
    required this.btnText,
    required this.onPressed,
  });

  final double? height;
  final double? width;
  final String btnText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 54,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff51afff),
            Color(0xff0c77d1),
            Color(0xff055598),
            Color(0xff033661),
          ],
          stops: [0.0, 0.3 ,0.7, 1],
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide.none,
          ),
        ),
        child: Text(btnText,style: AppStyles.white24Bold,),
      ),
    );
  }
}
