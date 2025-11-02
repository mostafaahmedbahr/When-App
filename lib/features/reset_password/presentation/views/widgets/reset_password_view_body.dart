import 'package:easy_localization/easy_localization.dart';
import 'package:when/features/reset_password/presentation/views/widgets/reset_password_button.dart';
import 'package:when/features/reset_password/presentation/views/widgets/reset_password_form.dart';

import '../../../../../main_importants.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

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
            Text(LocaleKeys.setNewPassword.tr(),
              style: AppStyles.gray20ExtraBold,
            ),
            verticalSpace(8),
            ResetPasswordForm(),
            verticalSpace(24),
            ResetPasswordButton(formKey : formKey),
          ],
        ),
    );
  }
}
