import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:service_provider/base/data/models/invoke_status.dart';

abstract class Interactor<P> {
  const Interactor();

  Stream<InvokeStatus> call(
    P params, {
    Duration timeout = defaultTimeout,
  }) async* {
    try {
      yield InvokeStarted();
      await doWork(params).timeout(
        timeout,
        onTimeout: () => throw TimeoutException(''),
      );
      yield InvokeSuccess();
    } catch (error) {
      yield InvokeError(error);
    }
  }

  @protected
  Future<void> doWork(P params);

  Future<void> executeSync(P params) async => doWork(params);

  static const Duration defaultTimeout = Duration(minutes: 5);
}

abstract class ResultInteractor<P, R> {
  const ResultInteractor();

  Future<R> call(P params) => doWork(params);

  @protected
  Future<R> doWork(P params);
}
