import 'package:easy_localization/easy_localization.dart';
import 'package:when/features/login/presentation/view_model/login_cubit.dart';
import 'package:when/features/login/presentation/view_model/login_states.dart';
import '../../../../../main_importants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit , LoginStates>(
      buildWhen: (previous, current){
        return current is ChangePasswordVisibleState;
      },
        builder: (context,state){
          var loginCubit = context.read<LoginCubit>();
          return Column(
            children: [
              CustomTextFormField(
                controller: loginCubit.emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: LocaleKeys.email.tr(),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(SvgImages.email,colorFilter: ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn)),
                ),
                validator: (value) => MyValidators.emailValidator(value),
              ),
              verticalSpace(16),
              CustomTextFormField(
                controller:  loginCubit.passwordController,
                keyboardType: TextInputType.visiblePassword,
                hintText: LocaleKeys.password.tr(),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(SvgImages.lock,colorFilter: ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn)),
                ),
                validator: (value) => MyValidators.passwordValidator(value),
                suffixIcon: IconButton(
                  color: AppColors.gray,
                  icon: loginCubit.isPasswordVisible
                      ? const Icon(Icons.visibility_off,color: AppColors.blackColor,)
                      : const Icon(Icons.visibility,color: AppColors.blackColor,),
                  onPressed: () {
                    loginCubit.changePasswordVisible();
                  },
                ),

                obscureText: loginCubit.isPasswordVisible,
              ),
            ],
          );
        },
    );
  }
}
