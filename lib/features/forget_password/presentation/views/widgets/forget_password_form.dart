import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_importants.dart';
import '../../view_model/forget_password_cubit.dart';
import '../../view_model/forget_password_states.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit , ForgetPasswordStates>(
      builder: (context,state){
        var forgetPasswordCubit = context.read<ForgetPasswordCubit>();
        return CustomTextFormField(
          controller:  forgetPasswordCubit.emailController,
          keyboardType: TextInputType.emailAddress,
          hintText: LocaleKeys.email.tr(),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(SvgImages.lock,colorFilter: ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn)),
          ),
          validator: (value) => MyValidators.passwordValidator(value),

        );
      },
    );
  }
}
