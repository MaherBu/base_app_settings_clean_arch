import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:service_provider/base/utils/colors.dart';
import 'package:service_provider/base/utils/error/failure.dart';
import 'package:service_provider/base/utils/fimber/fimber.dart';
import 'package:service_provider/base/utils/navigator/nav_order.dart';
import 'package:service_provider/base/utils/network_result.dart';

typedef ContextHandler<T> = T Function(BuildContext context);

abstract class BaseViewmodel extends _BaseViewmodelBase {
  BaseViewmodel(Logger logger) : super(logger);
}

abstract class _BaseViewmodelBase extends GetxController {
  _BaseViewmodelBase(this.logger);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @protected
  final Logger logger;

  final isLoading = false.obs;

  Rx<NavOrder>? navigator;

  Rx<ContextHandler>? contextHandler;

  RxString? connectionError;

  // void navigate({required NavOrder order}) {
  //   navigator.value = order;
  // }

  void getContext(ContextHandler handler) {
    contextHandler!.value = handler;
  }

  void startLoading() {
    isLoading(true);
  }

  void stopLoading() {
    isLoading(false);
  }

  Future<T> loadingRequest<T>(Future<T> Function() callback) async {
    connectionError = null;
    startLoading();
    final response = await callback();
    stopLoading();
    return response;
  }

  // ignore: todo
  // TODO: add general error handler with snackbar or toast or both.
  void showSnack(
      String message, {
        VoidCallback? action,
        Color backgroundColor = DARK_GREY,
        Color disabledTextColor = WHITE,
        Color textColor = WHITE,
        Duration duration = const Duration(minutes: 10),
        GlobalKey<ScaffoldState>? scaffoldKey,
      }) {
    (scaffoldKey ?? this.scaffoldKey).currentState!.showSnackBar(snackBarWidget(
      message,
      action: action,
      backgroundColor: backgroundColor,
      disabledTextColor: disabledTextColor,
      duration: duration,
      textColor: textColor,
    ));
  }

  SnackBar snackBarWidget(
      String message, {
        VoidCallback? action,
        Color backgroundColor = DARK_GREY,
        Color disabledTextColor = WHITE,
        Color textColor = WHITE,
        Duration duration = const Duration(minutes: 10),
      }) {
    return SnackBar(
      duration: duration,
      action: action != null
          ? SnackBarAction(
        label: 'retry',
        onPressed: action,
        disabledTextColor: disabledTextColor,
        textColor: textColor,
      )
          : null,
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }

  void unknownErrorHandler(dynamic cause) {
    getContext((context) {
      Fluttertoast.showToast(
        msg: 'msg_something_wrong',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: DARK_GREY,
        textColor: WHITE,
        fontSize: 16.0,
      );
    });
  }

  @protected
  Future<T> futureWrapper<T>(
      Future<T> Function() block, {
        void Function(String?)? catchBlock,
        void Function(dynamic cause)? unknownErrorHandler,
        bool useLoader = false,
      }) {
    connectionError = null;
    if (useLoader) {
      startLoading();
    }
    return _wrapError<T>(
      block(),
      block: catchBlock,
      unknownErrorHandler: unknownErrorHandler,
    ).whenComplete(() {
      if (useLoader) {
        stopLoading();
      }
    });
  }

  Future<T> _wrapError<T>(
      Future<T> future, {
        void Function(String?)? block,
        void Function(dynamic cause)? unknownErrorHandler,
      }) =>
      future.catchError((error) {
        if (error is CallException && error.cause is NetworkFailure) {
          logger.e('NetworkError in base view model $error');
          connectionError!.value = 'msg_no_internet';
        } else if (error is CallException && error.cause is ServerFailure) {
          logger.e('ServerFailure in base view model ${error.cause.message}');
          block!(error.cause.message);
        } else {
          logger.e('unknown error in base view model $error');
          unknownErrorHandler != null ? unknownErrorHandler(error) : this.unknownErrorHandler(error);
        }
        throw error;
      });

  Future<void> dispose() {
    return Future.value();
  }

  //  async {
  //   await cancelSubscription();
  // }
  //
  void toggleLoading() => isLoading.value = !isLoading.value;
}
