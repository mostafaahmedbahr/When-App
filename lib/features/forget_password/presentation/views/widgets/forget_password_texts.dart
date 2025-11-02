import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_importants.dart';

class ForgetPasswordTexts extends StatelessWidget {
  const ForgetPasswordTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
        LocaleKeys.forgetPassword.tr(),style: AppStyles.gray20ExtraBold,
    );
  }
}
