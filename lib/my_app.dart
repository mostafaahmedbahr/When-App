import 'package:easy_localization/easy_localization.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/shared_widgets/cubits/lang_cubit/lang_cubit.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'main_importants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()..checkAuthStatus()),
        BlocProvider(create: (context) => LanguageCubit()),
        // BlocProvider(create: (context) => LayoutCubit()),
        // BlocProvider(create: (context) => HomeCubit(getIt.get<HomeRepoImpl>())..getAllMainCategories()..getTryThisProductsData()..getHomeSliderBanners()),
        // BlocProvider(create: (context) => OtpCubit(getIt.get<OtpRepoImpl>())),
        // BlocProvider(create: (context) => AddAddressCubit(getIt.get<AddAddressRepoImpl>())..getAllAreas()),
        // BlocProvider(create: (context) => MakeOrderCubit(getIt.get<MakeOrderRepoImpl>())),
        // BlocProvider(create: (context) => OrderDetailsCubit(getIt.get<OrderDetailsRepoImpl>())),
        // BlocProvider(create: (context) => SearchProductsCubit(getIt.get<SearchRepoImpl>())),
        // BlocProvider(create: (context) => RegisterCubit(getIt.get<RegisterRepoImpl>())),
        // BlocProvider(create: (context) => MoreCubit(getIt.get<MoreRepoImpl>())),
        // BlocProvider(create: (context) => CartCubit(getIt.get<CartRepoImpl>())..getCartCounts()),
        // BlocProvider(create: (context) => LoginCubit(getIt.get<LoginRepoImpl>())),
        // BlocProvider(create: (context) => PreviousActivitiesCubit(getIt.get<PreviousActivitiesRepoImpl>())),
        // BlocProvider(create: (context) => RewardsCubit(getIt.get<RewardsRepoImpl>())),
        // BlocProvider(create: (context) => FavCubit(getIt.get<FavReposImpl>())..getAllFavProducts()),
        // BlocProvider(create: (context) => CategoryCubit(getIt.get<CategoryRepoImpl>())),
        // BlocProvider(create: (context) => NotificationsCubit(getIt.get<NotificationsRepoImpl>())),
        // BlocProvider(create: (context) => ProfileCubit(getIt.get<ProfileRepoImpl>())),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          // Update the app locale when LanguageCubit state changes
          context.setLocale(locale);
          return MaterialApp(
            navigatorKey: navigatorKey,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: locale,
            // locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: LocaleKeys.appName.tr(),
            theme: ThemeData(
              fontFamily: locale.languageCode == 'ar' ? "Cairo" : "RobotoCondensed",
              scaffoldBackgroundColor: AppColors.whiteColor,
              appBarTheme: const AppBarTheme(
                scrolledUnderElevation: 0,
                backgroundColor: AppColors.whiteColor,
              ),
              primarySwatch: Colors.blue,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: AppColors.whiteColor,
              ),
            ),
            home: const SplashView(),
            builder: (context, child) {
              SystemChrome.setSystemUIOverlayStyle(
                const SystemUiOverlayStyle(
                  systemNavigationBarColor: AppColors.whiteColor,
                  systemNavigationBarIconBrightness: Brightness.dark,
                ),
              );
              return ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: const [
                  Breakpoint(start: 0, end: 450, name: MOBILE),
                  Breakpoint(start: 451, end: 800, name: TABLET),
                  Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                ],
              );
            },
          );
        },
      ),
    );
  }
}