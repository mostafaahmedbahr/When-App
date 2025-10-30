
import 'package:when/core/utils/app_services/local_services/secure_storage_service.dart';

class CacheTokenManger {
  // Static variables to store tokens
  static String? userToken;
  static String? refreshToken;

  // Method to save both tokens
  static Future<void> saveTokens({required String accessToken, required String refreshToken}) async {
    userToken = accessToken;
    CacheTokenManger.refreshToken = refreshToken;

    await SecureStorageService.instance.writeData(key: 'userToken', value: accessToken);
    await SecureStorageService.instance.writeData(key: 'refreshToken', value: refreshToken);
  }

  // Method to retrieve access token
  static Future<String?> getUserToken() async {
    if (userToken != null) {
      return userToken;
    }
    String? token = await SecureStorageService.instance.readData(key: 'userToken');
    userToken = token;
    return token;
  }

  // Method to retrieve refresh token
  static Future<String?> getRefreshToken() async {
    if (refreshToken != null) {
      return refreshToken;
    }
    String? token = await SecureStorageService.instance.readData(key: 'refreshToken');
    refreshToken = token;
    return token;
  }

  // Method to update tokens (for refresh)
  static Future<void> updateTokens({required String accessToken, String? refreshToken}) async {
    userToken = accessToken;
    if (refreshToken != null) {
      CacheTokenManger.refreshToken = refreshToken;
      await SecureStorageService.instance.writeData(key: 'refreshToken', value: refreshToken);
    }
    await SecureStorageService.instance.writeData(key: 'userToken', value: accessToken);
  }

  // Method to clear all stored tokens
  static Future<void> clearTokens() async {
    userToken = null;
    refreshToken = null;
    await SecureStorageService.instance.deleteData(key: 'userToken');
    await SecureStorageService.instance.deleteData(key: 'refreshToken');
  }

  // Backward compatibility - keep your existing method
  static Future<void> saveUserToken(String token) async {
    await updateTokens(accessToken: token);
  }
}