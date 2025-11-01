
import 'package:easy_localization/easy_localization.dart';
import 'package:when/features/forget_paasword/presentation/views/widgets/pin_code_fields_widget.dart';
import 'package:when/features/forget_paasword/presentation/views/widgets/timer_count.dart';

import '../../../../core/shared_widgets/back_icon.dart';
import '../../../../core/shared_widgets/logo_widget.dart';
import '../../../../main_importants.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary,
              AppColors.white,
            ],
            stops: [0.0, 0.7],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              verticalSpace(50),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: BackIcon()),
              verticalSpace(30),
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
             // PinCodeFieldsWidget(controller: _otpController),
              PinCodeFieldsWidget( ),
              verticalSpace(24),
              CustomButton(
                btnText: LocaleKeys.confirmLogIn.tr(),
                onPressed: (){},
              ),
              verticalSpace(24),
              TimerCount(),
              TextButton(
                onPressed: (){},
                child: Text(LocaleKeys.resendCode.tr(),
                  style: AppStyles.gray14Medium.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
