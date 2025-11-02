 import 'package:easy_localization/easy_localization.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../../../../main_importants.dart';
import '../../view_model/register_cubit.dart';
import '../../view_model/register_states.dart';

class RegisterNameEmailPhoneForm extends StatelessWidget {
  const RegisterNameEmailPhoneForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(

      builder: (context, state) {
        var registerCubit = context.read<RegisterCubit>();

        return Column(
          children: [
           verticalSpace(28),

            /// Name Field
            CustomTextFormField(
              controller: registerCubit.nameCon,
              keyboardType: TextInputType.text,
              hintText: LocaleKeys.userName.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgImages.profile,colorFilter: ColorFilter.mode(AppColors.gray300, BlendMode.srcIn) ),
              ),
             validator: (value) => MyValidators.displayNameValidator(value),
            ),

            verticalSpace(20),

            /// Email Field
            CustomTextFormField(
              controller: registerCubit.emailCon,
              keyboardType: TextInputType.emailAddress,
              hintText: LocaleKeys.email.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgImages.email ),
              ),
              validator: (value) => MyValidators.emailValidator(value),
            ),

            verticalSpace(20),

            /// Phone Field using IntlPhoneField
            BlocBuilder<RegisterCubit, RegisterStates>(

    builder: (context, state) {


      return IntlPhoneField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: LocaleKeys.phone.tr(),
                    labelStyle: const TextStyle(color: AppColors.gray),
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                    filled: true,
                    fillColor: AppColors.whiteColor,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(150, 150, 150, 1),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(SvgImages.phone),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: AppColors.whiteColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: AppColors.whiteColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: AppColors.whiteColor),
                    ),
                  ),
                  initialCountryCode: 'EG',
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (PhoneNumber phone) {
                    registerCubit.phoneNumber = phone.completeNumber;
                    registerCubit.countryCode = phone.countryCode;
                  },
                  validator: (value){
                   return MyValidators.phoneValidator(
                      value?.completeNumber ?? '',
                      countryCode: registerCubit.countryCode,
                    );
                  },


                );
        }

            ),


          ],
        );
      },
    );
  }
}
