
abstract class PrefsRepository {
  const PrefsRepository();

  String? get accessToken;
  Future<bool> setAccessToken(String token);

  String? get refreshToken;
  Future<bool> setRefreshToken(String token);

  String? get code;
  Future<bool> setCode(String code);

  int? get fbId;
  Future<bool> setFbId(int fbId);

  String get languageCode;
  Future<bool> setApplicationLanguage(String languageCode);

  // Future<bool> clearUserData();

  // UserModel? get user;
  // Future<bool> setUser(UserModel user);

  String? get theme;
  Future<bool> setTheme(String theme);

  String? get firebaseToken;
  Future<bool> setFirebaseToken(String firebaseToken);

  int? get deviceGuid;
  Future<bool> setDeviceGuid(int deviceGuid);


  // bool get isReader;
  // bool get isCreator;
}
