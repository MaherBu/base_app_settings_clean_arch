import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:service_provider/app/domain/repositories/app_repository.dart';
import 'package:service_provider/base/domain/interactors/interactor.dart';
import 'package:service_provider/base/utils/extensions/future.dart';

part 'two_factor_status_interactor.freezed.dart';

@injectable
class TwoFactorStatusInteractor extends ResultInteractor<TwoFactorStatusInteractorParams, bool> {
  const TwoFactorStatusInteractor(this._appRepository);

  final AppRepository _appRepository;

  @override
  Future<bool> doWork(TwoFactorStatusInteractorParams params) =>
      _appRepository.getTwoFactorStatus().whenSuccess((it) => it);
}

@freezed
abstract class TwoFactorStatusInteractorParams with _$TwoFactorStatusInteractorParams {
  factory TwoFactorStatusInteractorParams() = _TwoFactorStatusInteractorParams;
}
