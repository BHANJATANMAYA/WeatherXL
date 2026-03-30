import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_constants.dart';

abstract class AuthLocalDataSource {
  Future<void> saveLoginState(bool isLoggedIn, String userId);
  Future<void> clearLoginState();
  bool isLoggedIn();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveLoginState(bool isLoggedIn, String userId) async {
    await sharedPreferences.setBool(AppConstants.keyIsLoggedIn, isLoggedIn);
    await sharedPreferences.setString(AppConstants.keyUserId, userId);
  }

  @override
  Future<void> clearLoginState() async {
    await sharedPreferences.remove(AppConstants.keyIsLoggedIn);
    await sharedPreferences.remove(AppConstants.keyUserId);
  }

  @override
  bool isLoggedIn() {
    return sharedPreferences.getBool(AppConstants.keyIsLoggedIn) ?? false;
  }
}
