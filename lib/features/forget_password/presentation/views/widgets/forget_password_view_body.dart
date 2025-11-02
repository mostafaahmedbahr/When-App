import '../../../../../main_importants.dart';
import 'forget_password_button.dart';
import 'forget_password_form.dart';
import 'forget_password_texts.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

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
          const ForgetPasswordTexts(),
          verticalSpace(12),
            const  ForgetPasswordForm(),
            verticalSpace(24),
            ForgetPasswordButton(formKey),
        ],
      ),
    );
  }
}
