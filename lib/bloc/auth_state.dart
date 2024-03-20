part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final String uid;

  AuthSuccess({required this.uid});
}

final class AuthFailed extends AuthState {
  final String error;

  AuthFailed({required this.error});
}

final class AuthLoading extends AuthState {}
