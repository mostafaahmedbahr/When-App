import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/notifications_helpers/firebase_messaging_service.dart';
import 'core/utils/notifications_helpers/get_fcm_token.dart';
import 'core/utils/notifications_helpers/local_notifications_service.dart';
import 'lang/codegen_loader.g.dart';
import 'main_importants.dart';
import 'my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  debugPrint("main");
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize cache first
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();

  // Get FCM token with error handling
  // await getFcmToken().catchError((e) {
  //   debugPrint('FCM token initialization failed (expected on simulator): $e');
  // });

  // Initialize notifications
  // final localNotificationsService = LocalNotificationsService.instance();
  // await localNotificationsService.init();
  //
  // final firebaseMessagingService = FirebaseMessagingService.instance();
  // await firebaseMessagingService.init(localNotificationsService: localNotificationsService);

  String? token = await CacheTokenManger.getUserToken();
  debugPrint("Retrieved token: $token");

  setup();
  Bloc.observer = SimpleBlocObserver();

  runApp(EasyLocalization(
    startLocale: const Locale('en',""),
    supportedLocales: const [
      Locale('ar',""),
      Locale('en',""),
    ],
    path: 'lib/lang',
    saveLocale: true,
    fallbackLocale: const Locale('en',""),
    useOnlyLangCode: true,
    assetLoader: const CodegenLoader(),
    child: const MyApp(),
  ));
}