
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../../features/forget_password/data/repos/forget_password_repo_imple.dart';
import '../../../../features/login/data/repos/login_repos_imple.dart';
import '../../../../features/register/data/register_repos/register_repos_imple.dart';
import '../../../../features/reset_password/data/repos/reset_password_repo_imple.dart';
import '../../../../features/verification_code/data/repos/verification_code_repo_imple.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setup() {
   getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<ForgetPasswordRepoImpl>(ForgetPasswordRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<VerificationCodeRepoImpl>(VerificationCodeRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<ResetPasswordRepoImpl>(ResetPasswordRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl(
    getIt.get<ApiService>(),
  ));
  // getIt.registerSingleton<CartRepoImpl>(CartRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<PreviousActivitiesRepoImpl>(PreviousActivitiesRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<RewardsRepoImpl>(RewardsRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<FavReposImpl>(FavReposImpl(
  //   getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<CategoryRepoImpl>(CategoryRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<ProductDetailsRepoImpl>(ProductDetailsRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
  //  getIt.registerSingleton<OrderDetailsRepoImpl>(OrderDetailsRepoImpl(
  //    getIt.get<ApiService>(),
  //  ));
  //  getIt.registerSingleton<AddAddressRepoImpl>(AddAddressRepoImpl(
  //    getIt.get<ApiService>(),
  //  ));
  //  getIt.registerSingleton<MakeOrderRepoImpl>(MakeOrderRepoImpl(
  //    getIt.get<ApiService>(),
  //  ));
  //  getIt.registerSingleton<NotificationsRepoImpl>(NotificationsRepoImpl(
  //    getIt.get<ApiService>(),
  //  ));

}