import 'package:easy_localization/easy_localization.dart';
import 'package:when/features/reset_password/presentation/views/reset_password_view.dart';

import '../../../../../main_importants.dart';
import '../../view_model/verification_code_cubit.dart';
import '../../view_model/verification_code_states.dart';

class VerificationCodeButton extends StatelessWidget {
  const VerificationCodeButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<VerificationCodeCubit , VerificationCodeStates>(
      buildWhen: (previous, current){
        return current is VerificationCodeSuccessState ||  current is VerificationCodeErrorState ||  current is VerificationCodeLoadingState;
      },
        listener: (context,state){
        if(state is VerificationCodeSuccessState){
          NewToast.showNewSuccessToast(msg: state.verificationCodeModel.message.toString(), context: context);

        }else if (state is VerificationCodeErrorState){
          NewToast.showNewErrorToast(msg: state.error.toString(), context: context);
        }
        },
    builder: (context,state){
        return
          state is VerificationCodeLoadingState ? CustomLoading():
          CustomButton(
          btnText: LocaleKeys.confirmLogIn.tr(),
          onPressed: (){
           AppNav.customNavigator(context: context, screen: ResetPasswordView());
            // if(formKey.currentState!.validate()){
            //   context.read<VerificationCodeCubit>().verificationCode();
            // }
          },
        );
    }

    );
  }
}
