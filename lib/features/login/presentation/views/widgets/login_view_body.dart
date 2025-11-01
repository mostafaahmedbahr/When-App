import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_importants.dart';
import '../../../../forget_password/presentation/views/forget_paasword_view.dart';
import 'login_button.dart';
import 'login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: ListView(
        children: [
          verticalSpace(100),
          Image.asset(PngsImages.logo),
          verticalSpace(50),
          LoginForm(),
          verticalSpace(24),
          LoginButton(formKey: formKey,),
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
      ),
    );
  }
}
