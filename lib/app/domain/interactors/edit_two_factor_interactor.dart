import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:service_provider/app/domain/repositories/app_repository.dart';
import 'package:service_provider/base/domain/interactors/interactor.dart';
import 'package:service_provider/base/utils/extensions/future.dart';

part 'edit_two_factor_interactor.freezed.dart';

@injectable
class EditTwoFactorInteractor
    extends ResultInteractor<EditTwoFactorInteractorParams, bool> {
  const EditTwoFactorInteractor(this._appRepository);

  final AppRepository _appRepository;

  @override
  Future<bool> doWork(EditTwoFactorInteractorParams params) =>
      _appRepository.editTwoFactor(params.enable).whenSuccess((it) => it);
}

@freezed
abstract class EditTwoFactorInteractorParams
    with _$EditTwoFactorInteractorParams {
  factory EditTwoFactorInteractorParams({
    required final bool enable,
  }) = _EditTwoFactorInteractorParams;
}
