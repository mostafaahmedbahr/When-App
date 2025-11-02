import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:when/features/verification_code/presentation/views/verification_code_view.dart';
import '../../../../../main_importants.dart';
import '../../view_model/forget_password_cubit.dart';
import '../../view_model/forget_password_states.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton(this.formKey, {super.key});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit , ForgetPasswordStates>(
      listener: (context,state){
        // if(state is ForgetPasswordSuccessState){
        //   NewToast.showNewSuccessToast(msg: state.resetPasswordModel.message.toString(),
        //       context: context);
        //   AppNav.customNavigator(context: context, screen: LoginView());
        // }
        // if(state is ForgetPasswordErrorState){
        //   NewToast.showNewErrorToast(msg: state.error.toString(),
        //       context: context);
        // }
      },
      builder: (context,state){
        var forgetPasswordCubit = context.read<ForgetPasswordCubit>();
        return
          ConditionalBuilder(
            condition: state is ! ForgetPasswordLoadingState,
            fallback: (context)=>CustomLoading(),
            builder: (context){
              return CustomButton(
                  btnText: LocaleKeys.next.tr(),
                  onPressed: (){
                    AppNav.customNavigator(context: context, screen: VerificationCodeView());
                  },
              );
            },
          );
      },
    );
  }
}
