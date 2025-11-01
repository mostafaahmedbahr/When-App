import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_importants.dart';
import '../../../../forget_paasword/presentation/views/forget_paasword_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(100),
        Image.asset(PngsImages.logo),
        verticalSpace(50),
        CustomTextFormField(
          hintText: LocaleKeys.userName.tr(),
        ),
        verticalSpace(16),
        CustomTextFormField(
          hintText: LocaleKeys.password.tr(),
        ),
        verticalSpace(24),
        CustomButton(
          btnText: LocaleKeys.login.tr(),
          onPressed: (){},
        ),
        verticalSpace(12),
        TextButton(
          onPressed: (){
            AppNav.customNavigator(context: context, screen: ForgetPasswordView());
          },
            child: Text(LocaleKeys.forgetPassword.tr(),
              style: AppStyles.gray14Medium.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
        ),
      ],
    );
  }
}
