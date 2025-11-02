

import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_importants.dart';
import '../../view_model/register_cubit.dart';
import '../../view_model/register_states.dart';

class RegisterPasswordForm extends StatelessWidget {
  const RegisterPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit , RegisterStates>(
      builder: (context,state){
        var registerCubit = context.read<RegisterCubit>();
        return Column(
          children: [
            verticalSpace(10),
            CustomTextFormField(
              controller:  registerCubit.passCon,
              keyboardType: TextInputType.visiblePassword,
              hintText: LocaleKeys.password.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgImages.lock,),
              ),
              validator: (value) => MyValidators.passwordValidator(value),
              suffixIcon: IconButton(
                color: AppColors.gray,
                icon: registerCubit.isVisible
                    ? const Icon(Icons.visibility_off,color: AppColors.blackColor,)
                    : const Icon(Icons.visibility,color: AppColors.blackColor,),
                onPressed: () {
                  registerCubit.changeSuffixIcon();
                },
              ),

              obscureText: registerCubit.isVisible,
            ),
            verticalSpace(20),
            CustomTextFormField(
              controller:  registerCubit.confirmPassCon,
              keyboardType: TextInputType.visiblePassword,
              hintText: LocaleKeys.confirmPassword.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgImages.lock,colorFilter: ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn)),
              ),
              validator: (String? value) {
                return MyValidators.repeatPasswordValidator(
                  value: value,
                  password: registerCubit.passCon.text,
                );
              },
              suffixIcon: IconButton(
                color: AppColors.gray,
                icon: registerCubit.isVisible2
                    ? const Icon(Icons.visibility_off,color: AppColors.blackColor,)
                    : const Icon(Icons.visibility,color: AppColors.blackColor,),
                onPressed: () {
                  registerCubit.changeSuffixIcon2();
                },
              ),

              obscureText: registerCubit.isVisible2,
            ),
          ],
        );
      },
    );
  }
}
