import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final email = event.email;
          final password = event.password;
          //Email validation using regex.

          if (password.length < 6) {
            return emit(
              AuthFailed(
                error: 'Password has be longer than 6 characters.',
              ),
            );
          }

          await Future.delayed(
            const Duration(seconds: 1),
            () {
              return emit(AuthSuccess(uid: '$email-$password'));
            },
          );
        } catch (e) {
          return emit(AuthFailed(error: e.toString()));
        }
      },
    );

    on<AuthLogoutRequested>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          await Future.delayed(
            const Duration(seconds: 1),
            () {
              return emit(AuthInitial());
            },
          );
        } catch (e) {
          emit(AuthFailed(error: e.toString()));
        }
      },
    );
  }
}
