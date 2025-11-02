 import 'package:when/features/forget_password/data/repos/forget_password_repo_imple.dart';
import 'package:when/features/forget_password/presentation/views/widgets/forget_password_view_body.dart';

import '../../../../main_importants.dart';
import '../view_model/forget_password_cubit.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary,
              AppColors.white,
            ],
            stops: [0.0, 0.7],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocProvider(
              create: (context)=>ForgetPasswordCubit(getIt.get<ForgetPasswordRepoImpl>()),
              child: ForgetPasswordViewBody()),
        ),
      ),
      //body:   ResetPasswordViewBody(),
    );
  }
}
