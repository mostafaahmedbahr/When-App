import 'package:when/features/verification_code/presentation/views/widgets/verification_code_view_body.dart';
import '../../../../main_importants.dart';
import '../../data/repos/verification_code_repo_imple.dart';
import '../view_model/verification_code_cubit.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

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
              create: (context)=>VerificationCodeCubit(getIt.get<VerificationCodeRepoImpl>()),
              child: VerificationCodeViewBody()),
        ),
      ),
    );
  }
}
