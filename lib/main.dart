import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'core/utils/bloc_observer.dart';
import 'lang/codegen_loader.g.dart';
import 'main_importants.dart';
import 'my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  debugPrint("main");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String? token = await CacheTokenManger.getUserToken();
  debugPrint("Retrieved token: $token");
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  await firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

  FirebaseMessaging.onMessageOpenedApp;

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {}
  });
  FirebaseMessaging.instance.subscribeToTopic('all');

  FirebaseMessaging.instance.getToken().then((value) async {
  });

  setup();

  Bloc.observer = SimpleBlocObserver();
  runApp(EasyLocalization(
      startLocale: const Locale('ar',""),
      supportedLocales: const [
        Locale('ar',""),
        Locale('en',""),
      ],
      path: 'lib/lang',
      saveLocale: true,
      fallbackLocale: const Locale('ar',""),
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child:  const MyApp()
  ),);
}