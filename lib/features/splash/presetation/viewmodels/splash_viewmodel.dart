import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:service_provider/base/utils/fimber/fimber.dart';


@injectable
class SplashViewmodel extends _SplashViewmodelBase {
  SplashViewmodel(
      Logger logger
      ) : super(logger);
}

abstract class _SplashViewmodelBase extends GetxController {
  _SplashViewmodelBase(Logger logger);

}
