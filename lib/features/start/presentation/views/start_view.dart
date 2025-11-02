import 'package:when/features/start/presentation/views/widgets/start_view_body.dart';
import '../../../../main_importants.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});
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
          child: StartViewBody(),
        ),
      ),
    );
  }
}
