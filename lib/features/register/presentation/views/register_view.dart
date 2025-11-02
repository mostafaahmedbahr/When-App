
import 'package:when/features/register/presentation/view_model/register_cubit.dart';
import 'package:when/features/register/presentation/views/widgets/register_view_body.dart';

import '../../../../main_importants.dart';
import '../../data/register_repos/register_repos_imple.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
              create: (context)=>RegisterCubit(getIt.get<RegisterRepoImpl>()),
              child: RegisterViewBody()),
        ),
      ),

    );
  }
}
