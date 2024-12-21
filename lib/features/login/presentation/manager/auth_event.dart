part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

final class LoginEvent extends AuthEvent {
  final LoginParam params;

  const LoginEvent(this.params);

  @override
  List<Object?> get props => [params];
}
