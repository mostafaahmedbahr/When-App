import 'package:easy_localization/easy_localization.dart';
import 'package:when/features/verification_code/presentation/views/widgets/pin_code_fields_widget.dart';
import 'package:when/features/verification_code/presentation/views/widgets/timer_count.dart';
import 'package:when/features/verification_code/presentation/views/widgets/verification_code_button.dart';
import '../../../../../main_importants.dart';

class VerificationCodeViewBody extends StatelessWidget {
  const VerificationCodeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          verticalSpace(40),
          BackIcon(),
          verticalSpace(18),
          LogoWidget(),
          verticalSpace(50),
          Text(LocaleKeys.phoneNumberVerification.tr(),
            style: AppStyles.gray20ExtraBold,
          ),
          verticalSpace(8),
          Text(LocaleKeys.phoneNumberVerificationMsg.tr(),
            style: AppStyles.gray18Medium,
          ),
          verticalSpace(8),
          TextButton(
            onPressed: (){},
            child: Text(LocaleKeys.editMail.tr(),
              style: AppStyles.gray14Medium.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          verticalSpace(12),
          PinCodeFieldsWidget(),
          verticalSpace(24),
          VerificationCodeButton(formKey: formKey,),
          verticalSpace(24),
          TimerCount(),
          TextButton(
            onPressed: (){},
            child: Text(LocaleKeys.resendCode.tr(),
              style: AppStyles.gray14Medium.copyWith(
                decoration: TextDecoration.underline,
                height: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
