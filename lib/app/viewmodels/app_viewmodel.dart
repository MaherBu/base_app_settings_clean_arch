import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:service_provider/base/domain/repositories/prefs_repository.dart';
import 'package:service_provider/base/utils/fimber/fimber.dart';


@injectable
class AppViewmodel extends _AppViewmodelBase {
  AppViewmodel(
    Logger logger,
    PrefsRepository prefsRepository,
  ) : super(
          logger,
          prefsRepository,
        );
}

abstract class _AppViewmodelBase extends GetxController {
  _AppViewmodelBase(
    Logger logger,
    this.prefsRepository,
  );

  final PrefsRepository prefsRepository;

  final languageLoading = false.obs;

  final deviceRegistered = false;

  RxBool? isLightTheme;

  Future<void> registerDevice() async {
    // TODO: implement fcm registeration
    // interactorWrapper(registerDeviceInteractor());
  }

  bool checkTheme() {
    if (prefsRepository.theme == 'dark') {
      return true;
    } else {
      return false;
    }
  }

  Future<void> changeTheme({required bool? isDark}) async {
    if (isDark!) {
      await prefsRepository.setTheme('dark');
    } else {
      await prefsRepository.setTheme('light');
    }
  }

// @action
// void getTwoFactorStatus() {
//   twoFactorStatusFuture = futureWrapper(
//       () => _twoFactorStatusInteractor(TwoFactorStatusInteractorParams()));
// }
//
// @action
// void editTwoFactor(bool enable) {
//   futureWrapper(
//     () => _editTwoFactorInteractor(
//             EditTwoFactorInteractorParams(enable: enable))
//         .then((it) => twoFactorStatusFuture = ObservableFuture.value(it)),
//   );
// }
}
