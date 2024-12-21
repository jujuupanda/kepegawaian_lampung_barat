part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

final class LoginSuccess extends AuthState {
  final AuthEntity loggedIn;

  const LoginSuccess(this.loggedIn);

  @override
  List<Object> get props => [loggedIn];
}

final class LoginFailed extends AuthState {
  final String errorMessage;

  const LoginFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
