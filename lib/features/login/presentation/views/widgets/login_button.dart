import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_importants.dart';
import '../../view_model/login_cubit.dart';
import '../../view_model/login_states.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit , LoginStates>(
      buildWhen: (previous, current){
        return current is LoginLoadingState || current is LoginSuccessState || current is LoginErrorState;
      },
      listener:  (context,state){
        if(state is LoginSuccessState){
          NewToast.showNewSuccessToast(msg: state.loginModel.message.toString(), context: context);
         // AppNav.customNavigator(context: context, screen: screen)
        }else if(state is LoginErrorState){
          NewToast.showNewErrorToast(msg: state.error.toString(), context: context);
        }
      },
      builder: (context,state){
        return
          state is LoginLoadingState ? CustomLoading():
          CustomButton(
          btnText: LocaleKeys.login.tr(),
          onPressed: (){
            if(formKey.currentState!.validate()){
              context.read<LoginCubit>().login();
            }

          },
        );
      } ,

    );
  }
}
