import '../../../../main_importants.dart';
import '../../data/models/login_model.dart';
import '../../data/repos/login_repos.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepo) : super(LoginInitState());
  LoginRepo? loginRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginModel? loginModel;

  Future<void> login() async {
    emit(LoginLoadingState());
    var result = await loginRepo!.login(email: emailController.text, password: passwordController.text);
    return result.fold(
      (failure) {
        emit(LoginErrorState(failure.errMessage));
      },
      (data) async {
        loginModel = data;
        cacheToken(token: loginModel!.data!.token.toString());
        emit(LoginSuccessState(data));
        clearControllers();
      },
    );
  }

  clearControllers() async {
    emailController.clear();
    passwordController.clear();
    emit(LoginInitState());
  }

  cacheToken({required String token}) async {
    await CacheTokenManger.saveUserToken(token);
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }


  bool isPasswordVisible = true;

  changePasswordVisible()
  {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibleState());
  }

}
