
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../../features/login/data/repos/login_repos_imple.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setup() {
   getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(
    getIt.get<ApiService>(),
  ));
  // getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<OtpRepoImpl>(OtpRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
  //
  // getIt.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<MoreRepoImpl>(MoreRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
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