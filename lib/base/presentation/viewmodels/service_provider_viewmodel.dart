import 'package:get/get.dart';
import 'package:service_provider/base/utils/fimber/fimber.dart';


enum StoreState {
  initial,
  loading,
  loaded,
  error,
}

abstract class BaseController extends _BaseController {
  BaseController(Logger logger) : super(logger);
}

abstract class _BaseController extends GetxController {
  _BaseController(this.logger);

  final Logger logger;

  // @observable
  // bool isLoading = false;

  RxString? errorMessage;

  final showScreenError = false.obs;

  final isLoading = false.obs;

  void startLoading() {
    isLoading(true);
  }

  void stopLoading() {
    isLoading(false);
  }

  Future<T> loadingRequest<T>(Future<T> Function() callback) async {
    startLoading();
    final response = await callback();
    stopLoading();
    return response;
  }

  Future<void> dispose() async {
    // await cancelSubscription();
  }
}
