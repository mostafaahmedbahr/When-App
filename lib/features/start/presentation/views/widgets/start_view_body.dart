import 'package:easy_localization/easy_localization.dart';
import 'package:when/features/login/presentation/views/login_view.dart';

import '../../../../../main_importants.dart';
import '../../../../register/presentation/views/register_view.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(PngsImages.logo),
        verticalSpace(50),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            LocaleKeys.welcome.tr(),
            style: AppStyles.gray20ExtraBold,
          ),
        ),
        verticalSpace(8),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            LocaleKeys.welcomeMsg.tr(),
            style: AppStyles.gray16Medium,
          ),
        ),
        verticalSpace(50),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                  btnText: LocaleKeys.login.tr(),
                  onPressed: (){
                    AppNav.customNavigator(context: context, screen: LoginView());
                  },
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: CustomButton(
                btnText: LocaleKeys.register.tr(),
                onPressed: (){
                  AppNav.customNavigator(context: context, screen: RegisterView());
                },
              ),
            ),
          ],
        ),
        verticalSpace(12),
        CustomButton(
          btnText: LocaleKeys.visitor.tr(),
          onPressed: () {
            context.read<AuthCubit>().loginAsGuest();
          },
        ),
        verticalSpace(8),
      ],
    );
  }
}
