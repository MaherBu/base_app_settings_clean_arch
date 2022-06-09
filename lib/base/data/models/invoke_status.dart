import 'package:equatable/equatable.dart';

abstract class InvokeStatus extends Equatable {}

class InvokeStarted extends InvokeStatus {
  @override
  List<Object> get props => [];
}

class InvokeSuccess extends InvokeStatus {
  @override
  List<Object> get props => [];
}

class InvokeError extends InvokeStatus {
  InvokeError(this.throwable);
  final dynamic throwable;
  @override
  List<Object> get props => [throwable.toString()];
}
