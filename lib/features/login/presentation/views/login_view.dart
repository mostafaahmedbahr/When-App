import 'package:when/features/login/presentation/view_model/login_cubit.dart';
import 'package:when/features/login/presentation/views/widgets/login_view_body.dart';
import '../../../../main_importants.dart';
import '../../data/repos/login_repos_imple.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              create: (context)=>LoginCubit(getIt.get<LoginRepoImpl>()),
              child: LoginViewBody()),
        ),
      ),
    );
  }
}
