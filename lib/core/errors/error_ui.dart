import '../../main_importants.dart';

class ErrorUi extends StatelessWidget {
  const ErrorUi({super.key, required this.errorState, required this.onPressed});
  final dynamic errorState;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: AppColors.error,
            size: 64,
          ),
          verticalSpace(16),
          Text(
            'Error !!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.error,
            ),
          ),
          verticalSpace(8),
          Text(
            errorState.error,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.gray100,
            ),
          ),
          verticalSpace(16),
          CustomButton(
            width: 200,
              btnText: "Try , Again",
            onPressed: onPressed,
          ),

        ],
      ),
    );
  }
}
