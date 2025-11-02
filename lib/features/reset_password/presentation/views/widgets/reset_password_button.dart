import 'package:easy_localization/easy_localization.dart';
import 'package:when/features/reset_password/presentation/view_model/reset_password_cubit.dart';
import 'package:when/features/reset_password/presentation/view_model/reset_password_states.dart';
import '../../../../../main_importants.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
      buildWhen: (previous, current) {
        return current is ResetPasswordSuccessState ||
            current is ResetPasswordErrorState ||
            current is ResetPasswordLoadingState;
      },
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
        } else if (state is ResetPasswordErrorState) {}
      },
      builder: (context, state) {
        return CustomButton(btnText: LocaleKeys.confirm.tr(), onPressed: () {

        });
      },
    );
  }
}
