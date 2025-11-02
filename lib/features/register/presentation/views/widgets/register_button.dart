import 'package:easy_localization/easy_localization.dart';
import 'package:when/features/register/presentation/view_model/register_cubit.dart';
import 'package:when/features/register/presentation/view_model/register_states.dart';

import '../../../../../main_importants.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit , RegisterStates>(
      buildWhen: (previous, current){
        return current is RegisterSuccessState || current is RegisterErrorState || current is RegisterLoadingState;
      },
      listener: (context,state){
        if(state is RegisterSuccessState){
          NewToast.showNewSuccessToast(msg: state.registerModel.message.toString(), context: context);
        }else if (state is RegisterErrorState){
          NewToast.showNewSuccessToast(msg: state.message.toString(), context: context);
        }
      },
    builder: (context,state){
        return CustomButton(
          btnText: LocaleKeys.register.tr(),
          onPressed: (){},
        );
    },
    );
  }
}
