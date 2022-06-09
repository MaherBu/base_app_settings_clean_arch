


import 'package:service_provider/base/data/datasource/base_locale_data_source.dart';
import 'package:service_provider/base/domain/repositories/prefs_repository.dart';

class BaseLocalDataSourceImpl implements BaseLocalDataSource {
  BaseLocalDataSourceImpl(this.prefsRepository);

  final PrefsRepository prefsRepository;

  @override
  Future<bool> setApplicationLanguage(language) =>
      prefsRepository.setApplicationLanguage(language);

  @override
  String get applicationLanguage => prefsRepository.languageCode;

  // @override
  // ProfileModel? get userProfile => prefsRepository.profile;

  // @override
  // String get currency => prefsRepository.currency;
}
