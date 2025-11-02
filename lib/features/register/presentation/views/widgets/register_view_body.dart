 import 'package:when/features/register/presentation/views/widgets/register_birth_date.dart';
import 'package:when/features/register/presentation/views/widgets/register_button.dart';
import 'package:when/features/register/presentation/views/widgets/register_gender.dart';
import 'package:when/features/register/presentation/views/widgets/register_name_email_phone_form.dart';
import 'package:when/features/register/presentation/views/widgets/register_password_form.dart';
import 'package:when/features/register/presentation/views/widgets/upload_profile_image.dart';

import '../../../../../main_importants.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          verticalSpace(40),
          BackIcon(),
          verticalSpace(40),
          const UploadProfileImage(),
          const RegisterNameEmailPhoneForm(),
          const RegisterPasswordForm(),
          verticalSpace(20),
          const RegisterGender(),
          verticalSpace(20),
          RegisterBirthDate(),
          verticalSpace(40),
          RegisterButton(),
        ],
      ),
    );
  }
}
