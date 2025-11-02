import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:when/features/verification_code/presentation/view_model/verification_code_cubit.dart';
import 'package:when/features/verification_code/presentation/view_model/verification_code_states.dart';

import '../../../../../main_importants.dart';

class PinCodeFieldsWidget extends StatelessWidget {
  const PinCodeFieldsWidget({super.key,  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCodeCubit , VerificationCodeStates>(
      buildWhen: (previous, current){
        return current is ChangeOtpValueState;
      },
      builder: (context,state){
        return Directionality(
          textDirection: TextDirection.ltr,
          child: PinCodeTextField(
            keyboardType : TextInputType.number,
            controller: context.read<VerificationCodeCubit>().verificationCodeController,
            length: 5,
            appContext: context,
            onChanged: (code) {
              context.read<VerificationCodeCubit>().changeOtpValue(code);
            },
            validator: (value) => MyValidators.codeValidator(value),
            onCompleted: (_) => FocusScope.of(context).unfocus(),
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              selectedColor: AppColors.primary,
              selectedFillColor: AppColors.primary,
              inactiveColor: AppColors.white,
              inactiveFillColor: AppColors.whiteColor,
              activeColor: AppColors.white,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(16),
              fieldHeight: 60,
              fieldWidth: 60,
              activeFillColor: Colors.white,
            ),
            cursorColor: Colors.white,
            animationDuration: const Duration(milliseconds: 300),
            enableActiveFill: true,
            beforeTextPaste: (text) => true,
          ),
        );
      },

    );
  }
}