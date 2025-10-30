import 'package:flutter_bloc/flutter_bloc.dart';
 import '../../../utils/app_services/local_services/cache_helper.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool isGuest = false;
  String? userToken;

  void checkAuthStatus() {
    userToken = CacheHelper.getData(key: "userToken");
    isGuest = CacheHelper.getData(key: "isGuest") ?? false;

    if (isGuest) {
      emit(AuthGuestState());
    } else if (userToken != null) {
      emit(AuthLoggedInState());
    } else {
      emit(AuthLoggedOutState());
    }
  }

  void loginAsGuest() {
    isGuest = true;
    userToken = null;
    CacheHelper.saveData(key: "isGuest", value: true);
    CacheHelper.removeData(key: "userToken");
    emit(AuthGuestState());
  }

  void loginWithToken(String userToken) {
    isGuest = false;
    userToken = userToken;
    CacheHelper.saveData(key: "isGuest", value: false);
    CacheHelper.saveData(key: "userToken", value: userToken);
    emit(AuthLoggedInState());
  }

  void logout() {
    isGuest = false;
    userToken = null;
    CacheHelper.removeData(key: "userToken");
    CacheHelper.removeData(key: "isGuest");
    emit(AuthLoggedOutState());
  }
}

