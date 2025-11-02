import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/shared_functions/fun_date_time.dart';
import '../../../../../main_importants.dart';
import '../../view_model/register_cubit.dart';
import '../../view_model/register_states.dart';

class RegisterBirthDate extends StatelessWidget {
  const RegisterBirthDate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      buildWhen: (previous, current) {
        return current is RegisterSelectBirthDateState;
      },
      builder: (context, state) {
        var registerCubit = RegisterCubit.get(context);
        return CustomTextFormField(
          readOnly: true,
          controller: TextEditingController(
            text: registerCubit.birthDate,
          ),
          hintText: LocaleKeys.birthDate.tr(),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.calendar_today, color: AppColors.gray300),
          ),
          onPressed: () async {
            final date = await selectDate(context);
            if (date != null) {
              registerCubit.selectBirthDate(date);

              if(context.mounted){
                Form.of(context).validate();
              }

            }
          },
          validator: (value) {
            if (registerCubit.birthDate == null ||
                registerCubit.birthDate!.isEmpty) {
              return LocaleKeys.pleaseSelectYourDateOfBirth.tr();
            }
            return null;
          },
        );
      },
    );
  }
}
