import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../app_services/local_services/cache_helper.dart';

Future<void> getFcmToken() async {
  try {
    String? token;

    if (Platform.isIOS) {
      // For iOS, don't try to get APNS token immediately as it may not be ready
      // Instead, wait a bit and try multiple approaches
      await Future.delayed(const Duration(seconds: 1));

      // Try to get FCM token directly (it handles APNS internally)
      token = await FirebaseMessaging.instance.getToken();

      if (token == null) {
        log('⚠️ FCM token is null on iOS - this is normal on simulator');
        return;
      }
      log("📱 iOS FCM Token = $token");

    } else if (Platform.isAndroid) {
      token = await FirebaseMessaging.instance.getToken();
      if (token == null) {
        log('⚠️ fcmToken is null on Android');
        return;
      }
      log("📱 Android FCM Token = $token");
    }

    if (token != null) {
      await CacheHelper.saveData(key: "fcmToken", value: token);
    }

    // Set up token refresh listener
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      CacheHelper.saveData(key: "fcmToken", value: newToken);
      log('🔄 FCM Token refreshed: $newToken');
    }).onError((err) {
      log('❌ Token refresh error: $err');
    });

  } catch (e, st) {
    log('❌ Error in getFcmToken: $e');
    log('This is expected on iOS simulator - push notifications only work on real devices');
  }
}