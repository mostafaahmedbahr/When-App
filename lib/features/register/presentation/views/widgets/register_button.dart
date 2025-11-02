import 'package:easy_localization/easy_localization.dart';
import 'package:when/features/register/presentation/view_model/register_cubit.dart';
import 'package:when/features/register/presentation/view_model/register_states.dart';

import '../../../../../main_importants.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
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
      var registerCubit = context.read<RegisterCubit>();
      return
        state is RegisterLoadingState ? CustomLoading():
        CustomButton(
          btnText: LocaleKeys.register.tr(),
          onPressed: (){

            if ( registerCubit.phoneNumber.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(LocaleKeys.phoneRequired.tr()),
                  backgroundColor: Colors.red,
                ),
              );
            }
            if (registerCubit.selectedGender == null) {
              registerCubit.showGenderValidation();
            }


            if (formKey.currentState!.validate()) {

              registerCubit.register();
            }
          },
        );
    },
    );
  }
}
