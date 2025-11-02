import 'package:when/features/reset_password/presentation/views/widgets/reset_password_view_body.dart';

import '../../../../main_importants.dart';
import '../../data/repos/reset_password_repo_imple.dart';
import '../view_model/reset_password_cubit.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
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
              create: (context)=>ResetPasswordCubit(getIt.get<ResetPasswordRepoImpl>()),
              child: ResetPasswordViewBody()),
        ),
      ),
    );
  }
}
