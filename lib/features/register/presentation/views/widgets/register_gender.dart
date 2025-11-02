import 'package:easy_localization/easy_localization.dart';
import 'package:when/core/shared_widgets/custom_drop_down.dart';
import 'package:when/features/register/presentation/view_model/register_cubit.dart';
import 'package:when/features/register/presentation/view_model/register_states.dart';
import '../../../../../main_importants.dart';

enum Gender { male, female }

class RegisterGender extends StatelessWidget {
  const RegisterGender({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      buildWhen: (previous, current) {
        return current is RegisterSelectGenderState || current is RegisterValidationErrorState;
      },
      builder: (context, state) {
        var registerCubit = context.read<RegisterCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdown<Gender>(
              value: registerCubit.selectedGender,
              items: Gender.values,
              hint: LocaleKeys.gender.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset(SvgImages.gender,colorFilter: ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn),),
              ),
              onChanged: (Gender? value) {
                registerCubit.selectGender(value);
                registerCubit.showGenderValidation();
              },
              borderColor: registerCubit.showGenderValidationError? AppColors.deepRed : AppColors.whiteColor,
              itemDisplayBuilder: (Gender gender) {
                switch (gender) {
                  case Gender.male:
                    return "Male";
                  case Gender.female:
                    return "Female";
                }
              },
            ),
            if (registerCubit.showGenderValidationError)
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 4),
                child: Text(
                  LocaleKeys.pleaseSelectYourGender.tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.deepRed,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}