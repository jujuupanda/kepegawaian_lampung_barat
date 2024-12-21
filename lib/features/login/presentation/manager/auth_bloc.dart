import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/failure_helper.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/use_cases/login_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUseCase loginUseCase;

  AuthBloc({
    required this.loginUseCase,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<LoginEvent>(onLogin);
  }

  Future<void> onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final userLogin = await loginUseCase.call(event.params);
      userLogin.fold(
        (failure) => emit(LoginFailed(FailureHelper.failure(failure))),
        (success) => emit(LoginSuccess(success)),
      );
    } catch (error) {
      emit(LoginFailed(error.toString()));
    }
  }
}
