import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:service_provider/base/domain/repositories/prefs_repository.dart';
import 'package:service_provider/base/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: PrefsRepository)
class PrefsRepositoryImpl implements PrefsRepository {
  const PrefsRepositoryImpl(this._prefs);

  final SharedPreferences _prefs;

  static const List<String> _keysForDelete = [
    PrefsKeys.userAccessToken,
    PrefsKeys.userRefreshToken,
    PrefsKeys.fbId,
    PrefsKeys.user,
  ];

  @override
  String? get accessToken => _prefs.getString(PrefsKeys.userAccessToken);

  @override
  String? get code => _prefs.getString(PrefsKeys.code);

  @override
  String? get theme => _prefs.getString(PrefsKeys.theme);

  @override
  Future<bool> setAccessToken(String token) => _prefs.setString(PrefsKeys.userAccessToken, token);

  @override
  String? get refreshToken => _prefs.getString(PrefsKeys.userRefreshToken);

  @override
  Future<bool> setRefreshToken(String token) => _prefs.setString(PrefsKeys.userRefreshToken, token);

  @override
  int? get fbId => _prefs.getInt(PrefsKeys.fbId);

  @override
  Future<bool> setFbId(int fbId) => _prefs.setInt(PrefsKeys.fbId, fbId);

  @override
  String get languageCode => _prefs.getString(PrefsKeys.language) ?? LANGUAGE_ENGLISH;

  @override
  Future<bool> setApplicationLanguage(String languageCode) => _prefs.setString(PrefsKeys.language, languageCode);

  // @override
  // UserModel? get user {
  //   final jsonPlayer = _prefs.getString(PrefsKeys.user);
  //   if (jsonPlayer == null || jsonPlayer.isEmpty) {
  //     return null;
  //   }
  //   final Map<String, dynamic> jsonUser = json.decode(jsonPlayer);
  //   return jsonPlayer != null ? UserModel.fromJson(jsonUser) : null;
  // }

  // @override
  // Future<bool> setUser(UserModel player) async {
  //   final String user = json.encode(player);
  //   return _prefs.setString(PrefsKeys.user, user);
  // }

  // @override
  // bool get isReader => user?.role == UserRole.content_reader;
  // @override
  // bool get isCreator => user?.role == UserRole.content_creator;

  // @override
  // Future<bool> clearUserData() async {
  //   for (final key in PrefsRepositoryImpl._keysForDelete) {
  //     await _prefs.remove(key);
  //   }
  //   await GetIt.I.resetLazySingleton<UserModel>();
  //   return true;
  // }

  @override
  Future<bool> setCode(String code) async {
    await _prefs.setString(PrefsKeys.code, code);
    return true;
  }

  @override
  Future<bool> setTheme(String theme) async {
    await _prefs.setString(PrefsKeys.theme, theme);
    return true;
  }

  @override
  int? get deviceGuid => _prefs.getInt(PrefsKeys.deviceGuid);

  @override
  String? get firebaseToken => _prefs.getString(PrefsKeys.firebaseToken);

  @override
  Future<bool> setDeviceGuid(int deviceGuid) {
    return _prefs.setInt(PrefsKeys.deviceGuid, deviceGuid);
  }

  @override
  Future<bool> setFirebaseToken(String firebaseToken) {
    return _prefs.setString(PrefsKeys.firebaseToken, firebaseToken);
  }

}
