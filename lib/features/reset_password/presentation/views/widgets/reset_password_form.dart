import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_importants.dart';
import '../../view_model/reset_password_cubit.dart';
import '../../view_model/reset_password_states.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit , ResetPasswordStates>(
      buildWhen: (previous, current){
        return current is ChangeSuffixIconState || current is ChangeSuffixIconState2;
      },
      builder: (context,state){
        var resetPasswordCubit = context.read<ResetPasswordCubit>();
        return Column(
          children: [
            CustomTextFormField(
              controller:  resetPasswordCubit.newPasswordController,
              keyboardType: TextInputType.visiblePassword,
              hintText: LocaleKeys.newPassword.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgImages.lock,colorFilter: ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn)),
              ),
              validator: (value) => MyValidators.passwordValidator(value),
              suffixIcon: IconButton(
                color: AppColors.gray,
                icon: resetPasswordCubit.isVisible
                    ? const Icon(Icons.visibility_off,color: AppColors.blackColor,)
                    : const Icon(Icons.visibility,color: AppColors.blackColor,),
                onPressed: () {
                  resetPasswordCubit.changeSuffixIcon();
                },
              ),

              obscureText: resetPasswordCubit.isVisible,
            ),
            verticalSpace(16),
            CustomTextFormField(
              controller:  resetPasswordCubit.newPassConfirmationController,
              keyboardType: TextInputType.visiblePassword,
              hintText: LocaleKeys.confirmNewPassword.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgImages.lock,colorFilter: ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn)),
              ),
              validator: (String? value) {
                return MyValidators.repeatPasswordValidator(
                  value: value,
                  password: resetPasswordCubit.newPasswordController.text,
                );
              },
              suffixIcon: IconButton(
                color: AppColors.gray,
                icon: resetPasswordCubit.isVisible2
                    ? const Icon(Icons.visibility_off,color: AppColors.blackColor,)
                    : const Icon(Icons.visibility,color: AppColors.blackColor,),
                onPressed: () {
                  resetPasswordCubit.changeSuffixIcon2();
                },
              ),

              obscureText: resetPasswordCubit.isVisible2,
            ),
          ],
        );
      },
    );
  }
}
